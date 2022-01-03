import 'package:get/get.dart';

// BottomNavigation Page Controller

class BottomNavigationController extends GetxController {
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
    update();
  }
}