import 'package:capturestarmonitoring/app/binding/bottom_nav_binding.dart';
import 'package:capturestarmonitoring/app/binding/weather_binding.dart';
import 'package:capturestarmonitoring/app/ui/ui.dart';
import 'package:get/get.dart';

class AppRoutes {
  AppRoutes._();

  static final routes = [
    GetPage(
        name: '/home', page: () => const HomePage()),
    GetPage(name: '/main', page: () => const MainPage(), bindings: [ WeatherBinding(), BottomNavigationBinding()]),
    GetPage(name: '/login', page: () => LoginPage()),
    GetPage(name: '/setting', page: () => const SettingPage()),
    GetPage(name: '/error', page: () => const ErrorPage()),
  ];
}
