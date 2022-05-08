import 'package:blog_task/controllers/auth_controller.dart';
import 'package:blog_task/controllers/drink_controller.dart';
import 'package:blog_task/controllers/local_data_controller.dart';
import 'package:blog_task/controllers/user_controller.dart';
import 'package:blog_task/screens/drinks/drink_screen.dart';
import 'package:blog_task/screens/login.dart';
import 'package:blog_task/screens/medicen/medicen_screen.dart';
import 'package:blog_task/screens/user_screen/user_screen.dart';
import 'package:blog_task/utils/internet.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'constants/constant.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ConnectionStatusSingleton connectionStatus =
      ConnectionStatusSingleton.getInstance();
  connectionStatus.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await UserController.checkLoginStatus();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => LocalDataController()),
        ChangeNotifierProvider(create: (_) => DrinkController()),
      ],
      child: GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: UserController.user != null
              ? const HomePage()
              : const LoginScreen()),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics:
            const NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
        controller: _tabController,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          const DrinkScreen(),
          const MedicineScreen(),
          const ProfileDetail(),
        ],
      
       
      ),
       bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        backgroundColor: Colors.black54,
        items: <Widget>[
          ...tabbarItems.values
              .map(
                (e) => Icon(
                  e,
                  size: 25,
                  color: Colors.black,
                ),
              )
              .toList(),
          // Icon(Icons.list, size: 30),
          // Icon(Icons.compare_arrows, size: 30),
        ],
        onTap: (index) {
            _tabController!.index = index;
        },
      ),
    );
  }
}
