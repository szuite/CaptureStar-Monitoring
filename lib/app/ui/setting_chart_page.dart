import 'package:auto_size_text/auto_size_text.dart';
import 'package:capturestarmonitoring/app/constants/constants.dart';
import 'package:capturestarmonitoring/app/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingChartPage extends StatelessWidget {
  const SettingChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    SettingController _controller =
        Get.put<SettingController>(SettingController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('차트 설정'),
        backgroundColor: AppThemes.whiteLilac,
        elevation: 0,
        foregroundColor: AppThemes.blackPearl,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(
                left: 28.0, right: 28.0, top: 28.0, bottom: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  '발전현황',
                  style: theme.headline4,
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Material(
                  color: AppThemes.white,
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: AppConstants.chartSettingMenu.length,
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
                      if (index == AppConstants.chartSettingMenu.length) {
                        return const SizedBox.shrink();
                      }

                      return Obx(() => SwitchListTile(
                          title: Text(AppConstants.chartSettingMenu[index]),
                          value: _controller.on.value,
                          onChanged: (val) {
                            print(val);
                            _controller.toggle();
                          }));
                    },
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                AutoSizeText(
                  '기상정보',
                  style: theme.headline4,
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Material(
                  color: AppThemes.white,
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: AppConstants.climateSettingMenu.length,
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
                      if (index == AppConstants.climateSettingMenu.length) {
                        return const SizedBox.shrink();
                      }

                      return Obx(() => SwitchListTile(
                          title: Text(AppConstants.climateSettingMenu[index]),
                          value: _controller.on.value,
                          onChanged: (val) {
                            print(val);
                            _controller.toggle();
                          }));
                    },
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                AutoSizeText(
                  '변환현황',
                  style: theme.headline4,
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Material(
                  color: AppThemes.white,
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: AppConstants.conversionSettingMenu.length,
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
                      if (index == AppConstants.conversionSettingMenu.length) {
                        return const SizedBox.shrink();
                      }

                      return Obx(() => SwitchListTile(
                          title:
                              Text(AppConstants.conversionSettingMenu[index]),
                          value: _controller.on.value,
                          onChanged: (val) {
                            print(val);
                            _controller.toggle();
                          }));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
