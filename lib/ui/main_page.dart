import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:capturestarmonitoring/controllers/bottom_nav_controller.dart';
import 'package:capturestarmonitoring/ui/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final _categoryNames = <String>[
    '홈',
    '발전현황',
    '기상정보',
    '변환통계',
    '설정',
  ];

  final iconList = [
    Icons.home,
    CupertinoIcons.speedometer,
    CupertinoIcons.cloud_sun_fill,
    CupertinoIcons.chart_pie,
    Icons.settings,
  ];

  @override
  Widget build(BuildContext context) {
    Get.put<BottomNavigationController>(BottomNavigationController());

    return GetBuilder<BottomNavigationController>(
      builder: (controller) {
        return Scaffold(
            body: SafeArea(
              child: IndexedStack(
                index: controller.tabIndex,
                children: [
                  Home(),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.yellow,
                  ),
                  Container(
                    color: Colors.blue,
                  ),
                  Setting(),
                ],
              ),
            ),
            bottomNavigationBar: AnimatedBottomNavigationBar.builder(
                height: 65,
                itemCount: iconList.length,
                tabBuilder: (int index, bool isActive) {
                  final color = isActive ? HexColor('#FFA400') : Colors.white;

                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          iconList[index],
                          size: 24,
                          color: color,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            _categoryNames[index].toString(),
                            maxLines: 1,
                            style: TextStyle(
                              color: color,
                              fontSize: 12,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
                backgroundColor: HexColor('#373A36'),
                activeIndex: controller.tabIndex,
                notchSmoothness: NotchSmoothness.verySmoothEdge,
                splashColor: HexColor('#FFA400'),
                splashSpeedInMilliseconds: 300,
                gapLocation: GapLocation.none,
                leftCornerRadius: 32,
                rightCornerRadius: 32,
                onTap: controller.changeTabIndex),
        );
      },
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
