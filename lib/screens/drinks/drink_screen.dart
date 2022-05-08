import 'package:blog_task/constants/style.dart';
import 'package:blog_task/controllers/drink_controller.dart';
import 'package:blog_task/controllers/user_controller.dart';
import 'package:blog_task/screens/drinks/widgets/drink_widgets.dart';
import 'package:blog_task/utils/internet.dart';
import 'package:blog_task/utils/widgets/custom_loader.dart';
import 'package:blog_task/utils/widgets/custom_no_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class DrinkScreen extends StatefulWidget {
  const DrinkScreen({Key? key}) : super(key: key);

  @override
  State<DrinkScreen> createState() => _DrinkScreenState();
}

class _DrinkScreenState extends State<DrinkScreen> {
  late StreamSubscription _connectionChangeStream;
  bool isOffline = false;

  @override
  void initState() {
    super.initState();

    ConnectionStatusSingleton connectionStatus =
        ConnectionStatusSingleton.getInstance();
    _connectionChangeStream =
        connectionStatus.connectionChange.listen(connectionChanged);
  }

  void connectionChanged(dynamic hasConnection) {
    setState(() {
      isOffline = !hasConnection;
    });
  }

  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final localData = Provider.of<DrinkController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Text(UserController.user!.email.toString()),
        actions: [
          if (isOffline)
            IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: const Icon(Icons.refresh))
        ],
      ),
      body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            //  color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(const Radius.circular(15))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: searchField(localData,_searchController),
                        )),
                  ),
                ],
              ),
            ),
            FutureBuilder(
                future: localData.getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CustomLoaderFullScreen();
                  }
                  if (snapshot.data == null) {
                    return CustomNoDataWidget(
                      onTap: () {
                        // setState(() {});
                      },
                    );
                  }
                  // localData.list = getList(context);
                  return buildListView(localData);
                }),
          ],
        ),
    );
  }

}
