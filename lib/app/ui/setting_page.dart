import 'package:auto_size_text/auto_size_text.dart';
import 'package:capturestarmonitoring/app/constants/constants.dart';
import 'package:capturestarmonitoring/app/controller/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

import 'components/components.dart';
import 'ui.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    Get.put<ThemeController>(ThemeController());
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 28, top: 40, right: 28, bottom: 34),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Home 제목
                AutoSizeText(
                  '설정',
                  style: theme.headline2,
                ),

                const SizedBox(height: 28.0),

                const UserDataForm(),

                const SizedBox(height: 28.0),

                Expanded(
                  child: Material(
                    color: AppThemes.white,
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    child: ListView.separated(
                      itemCount: AppConstants.settingMenu.length + 1,
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
                        if (index == AppConstants.settingMenu.length) {
                          return const SizedBox.shrink();
                        }

                        return ListTile(
                          title: Text(AppConstants.settingMenu[index]),
                          trailing: SvgPicture.asset(
                            'assets/images/chevron_left.svg',
                            color: AppThemes.arrowColor,
                          ),
                          onTap: () {
                            switch (index) {
                              case 0:
                                Get.to(() => const InstructionPage());
                                break;
                              case 1:
                                Get.to(() => const PushAlarmPage());
                                break;
                              case 2:
                                Get.to(() => const SettingChartPage());
                                break;
                              case 3:
                                Get.to(() => const CustomerCenterPage());
                                break;
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
                //_buildLayoutSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLayoutSection(BuildContext context) {
    return ListView(
      children: [themeListTile(context)],
    );
  }

  int _currentSelection = 0;

  themeListTile(BuildContext context) {
    /*   final List<MenuOptionsModel> themeOptions = [
      MenuOptionsModel(
        key: "light", value: 'Light Theme', icon: Icons.brightness_4),
      MenuOptionsModel(
        key: "dark", value: 'Dark Theme', icon: Icons.brightness_low),
    ];
*/
    Map<int, Widget> _children = {
      0: const Text('Light'),
      1: const Text('Dark')
    };

    return GetBuilder<ThemeController>(
      builder: (controller) => ListTile(
        title: const Text('테마 설정'),
        trailing: MaterialSegmentedControl(
          children: _children,
          selectionIndex: _currentSelection,
          selectedColor: Colors.blueAccent,
          borderColor: Colors.grey,
          unselectedColor: Colors.white,
          borderRadius: 32,
          disabledChildren: const [2],
          onSegmentChosen: (int index) {
            setState(() {
              _currentSelection = index;
              if (index == 0) {
                controller.setThemeMode('light');
              } else {
                controller.setThemeMode('dark');
              }
            });
          },
        ),
        /*   trailing: SegmentedSelector(
          selectedOption: controller.currentTheme,
          menuOptions: themeOptions,
          onValueChanged: (value) {
            controller.setThemeMode(value);
          }
        )*/
      ),
    );
  }
}
