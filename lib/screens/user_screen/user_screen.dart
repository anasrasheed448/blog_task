import 'dart:async';

import 'package:blog_task/constants/constant.dart';
import 'package:blog_task/constants/style.dart';
import 'package:blog_task/controllers/auth_controller.dart';
import 'package:blog_task/controllers/user_controller.dart';
import 'package:blog_task/screens/user_screen/user_widget.dart';
import 'package:blog_task/utils/internet.dart';
import 'package:blog_task/utils/widgets/custom_loader.dart';
import 'package:blog_task/utils/widgets/custom_no_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({Key? key}) : super(key: key);

  @override
  _ProfileDetailState createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).buttonColor,
      appBar: AppBar(
        backgroundColor: primary,
        elevation: 0,
        title: const Text(
          "User Info",
        ),
      ),
      body: FutureBuilder(
        future: UserController.getData(),
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
          final user = UserController.userInfo!.results.first;
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).buttonColor,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            ),
            child: Column(
              children: [
                buildHeader(user),
                Row(
                  children: [
                    textField(user.gender),
                    textField(convertDate(user.dob.date))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    textField(user.location.city),
                    textField(user.location.country)
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ProfileDetailWidget(title: 'Phone', value: '${user.phone}'),
                ProfileDetailWidget(title: 'Email', value: '${user.email}'),
                ProfileDetailWidget(
                    title: 'Address',
                    value:
                        '${user.location.street.name} ${user.location.street.number}'),
              const Expanded(child:  SizedBox()),
               ElevatedButton(onPressed: ()=>Provider.of<AuthController>(context,listen: false).signout(), child: const Text('Logout'),style: ElevatedButton.styleFrom(primary: primary,fixedSize: const Size(200, 40)),)
             , const SizedBox(height: 10,)
              ],
            ),
          );
        },
      ),
    );
  }
}