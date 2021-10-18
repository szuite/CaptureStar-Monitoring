import 'dart:core';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:capturestarmonitoring/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final LoginController controller = Get.put(LoginController());
    //controller.getUser();
    var _bottomNavIndex = 0;

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

    return Scaffold(
      body: Home(), //destination screen

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
                      style: TextStyle(color: color, fontSize: 12,),
                    ),
                  )
                ],
              ),
            );
          },
          backgroundColor: HexColor('#373A36'),
          activeIndex: _bottomNavIndex,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          gapLocation: GapLocation.none,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          onTap: (index) {}),
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

/*
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("메인화면"),
        textStyle: TextStyle(fontSize: 10),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset("assets/images/speedometer.png", fit: BoxFit.fitHeight, height: 20,),
        title: ("발전현황"),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CustomIcons.cloudy),
        title: ("기상정보"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CustomIcons.pie_chart),
        title: ("변환 통계"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.black,
      ),
    ];
  }

  List<Widget> _buildScreens() {
    return [
      const Home(),
      const Home(),
      const Home(),
      const Home(),
    ];
  }*/
}
