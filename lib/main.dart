import 'package:flutter/material.dart';
import 'package:flutter_task_cartgeek/src/core/routes/routes.dart';
import 'package:flutter_task_cartgeek/src/presentation/view/bottomNavigation/bottom_navigation.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'src/core/di/di.dart' as di;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return GetMaterialApp(
              title: 'cartGeek_task',
              getPages: AppPages.pages,
              home: BottomNavigationPage(),
              //initialRoute: Routes.bottomNavigation
          );
        }
    );
  }
}







