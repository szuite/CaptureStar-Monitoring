import 'package:capturestarmonitoring/app/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';

class BottomNavigationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationController>(() => BottomNavigationController());
  }
}