import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:capturestarmonitoring/app/controller/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

import 'ui.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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

  late final BottomNavigationController _navigationController;
  final List<Widget> _pages = const [
    HomePage(),
    DevelopmentStatusPage(),
    WeatherInfoPage(),
    StatisticsPage(),
    SettingPage(),
  ];

  @override
  void initState() {
    super.initState();
    _navigationController = Get.find();
  }

  @override
  void dispose() {
    _navigationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => IndexedStack(
            index: _navigationController.tabIndex.value,
            children: _pages,
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => AnimatedBottomNavigationBar.builder(
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
            activeIndex: _navigationController.tabIndex.value,
            notchSmoothness: NotchSmoothness.verySmoothEdge,
            splashColor: HexColor('#FFA400'),
            splashSpeedInMilliseconds: 300,
            gapLocation: GapLocation.none,
            leftCornerRadius: 32,
            rightCornerRadius: 32,
            onTap: _navigationController.changeTabIndex),
      ),
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
