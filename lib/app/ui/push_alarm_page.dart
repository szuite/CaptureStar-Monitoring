import 'package:capturestarmonitoring/app/constants/constants.dart';
import 'package:capturestarmonitoring/app/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PushAlarmPage extends StatelessWidget {
  const PushAlarmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    SettingController _controller =
        Get.put<SettingController>(SettingController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('푸시알림'),
        backgroundColor: AppThemes.whiteLilac,
        elevation: 0,
        foregroundColor: AppThemes.blackPearl,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 170,
          padding: const EdgeInsets.only(
              left: 28.0, right: 28.0, top: 28.0, bottom: 28.0),
          child: Material(
            color: AppThemes.white,
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            child: ListView.separated(
              itemCount: AppConstants.pushAlarmMenu.length + 1,
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 2,
                  thickness: 1.0,
                  indent: 20,
                  endIndent: 20,
                  color: AppThemes.dividerColor,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                if (index == AppConstants.pushAlarmMenu.length) {
                  return const SizedBox.shrink();
                }

                return Obx(() => SwitchListTile(
                    title: Text(AppConstants.pushAlarmMenu[index]),
                    value: _controller.on.value,

                    onChanged: (val) {
                      print(val);
                      _controller.toggle();
                    }));
              },
            ),
          ),
        ),
      ),
    );
  }
}
