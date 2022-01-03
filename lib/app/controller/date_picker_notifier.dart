import 'package:get/get.dart';

class DatePickerNotifier extends GetxController {
  String? flag;

  void setFlag(String flag) {
    this.flag = flag;
  }

  String? getFlag() {
    return flag;
  }
}