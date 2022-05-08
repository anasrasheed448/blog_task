import 'package:blog_task/constants/style.dart';
import 'package:blog_task/controllers/local_data_controller.dart';
import 'package:blog_task/controllers/user_controller.dart';
import 'package:blog_task/models/local.dart';
import 'package:blog_task/utils/widgets/custom_loader.dart';
import 'package:blog_task/utils/widgets/custom_no_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/medicen_widget.dart';

class MedicineScreen extends StatefulWidget {
  const MedicineScreen({Key? key}) : super(key: key);

  @override
  State<MedicineScreen> createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  @override
  Widget build(BuildContext context) {
    final localData = Provider.of<LocalDataController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Text(UserController.user!.email.toString()),
      ),
      body: FutureBuilder(
          future: localData.getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CustomLoaderFullScreen();
            }
            if (snapshot.data == null) {
              return CustomNoDataWidget(
                onTap: () {
                  setState(() {});
                },
              );
            }
            final _clientList = localData
                .data!
                .problems
                .first
                .diabetes
                .first
                .medications
                .first
                .medicationsClasses
                .first
                .className
                .first
                .associatedDrug;
            return ListView.builder(
                shrinkWrap: true,
                itemCount: _clientList.length, //client.list.value.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  AssociatedDrug sClient = _clientList[index];
                  return buildListTile(sClient);
                });
          }),
    );
  }

}
