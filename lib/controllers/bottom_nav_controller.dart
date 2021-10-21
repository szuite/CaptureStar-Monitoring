import 'package:get/get.dart';

// BottomNavigation Page Controller

class BottomNavigationController extends GetxController {
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}