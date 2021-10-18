import 'package:capturestarmonitoring/home.dart';
import 'package:capturestarmonitoring/ui/login_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  AppRoutes._();

  static final routes = [
    GetPage(name: '/home', page: () => const Home()),
    GetPage(name: '/login', page: () => LoginPage())
  ];
}