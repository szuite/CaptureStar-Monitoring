import 'package:get/get.dart';

// Setting Page Controller

class SettingController extends GetxController {
  RxBool on = false.obs;

  void toggle() => on.value = on.value ? false : true;
}