import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'app/constants/constants.dart';
import 'package:capturestarmonitoring/app/controller/controller.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<ThemeController>(ThemeController());
  await Hive.initFlutter();
  await Hive.openBox('calendar');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _permission = false;

  void _getPermission() async {
    final grant = await Permission.location.request().isGranted;
    setState(() {
      _permission = grant;
    });
  }

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      initialRoute: '/login',
      getPages: AppRoutes.routes,
    );
  }

  @override
  void initState() {
    _getPermission();
    super.initState();
  }
}

// Scroll Glow Effect 제거 클래스
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
