import 'package:capturestarmonitoring/controllers/theme_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    Get.put<ThemeController>(ThemeController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: _buildLayoutSection(context),
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
      0: Text('Light'),
      1: Text('Dark')
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
