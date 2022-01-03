import 'package:capturestarmonitoring/app/constants/constants.dart';
import 'package:capturestarmonitoring/app/controller/weather_controller.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'components/components.dart';

// 기상 정보 페이지

class WeatherInfoPage extends StatelessWidget {
  const WeatherInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('WeatherInfoPage');
    final theme = Theme.of(context).textTheme;

    WeatherController controller = Get.find();/*
    Future<Position> position = controller.getLocation();
    position.then((position) =>
        controller.getWeather(lat: position.latitude, lon: position.longitude));
*/
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MainTitle(title: AppConstants.weatherInformation),
                const SizedBox(
                  height: 28,
                ),

                // 추후 적용
                // const CircleBoxForm(title: '기상정보 요약',),

                const WeatherInfoSummary(),
                const SizedBox(
                  height: 28,
                ),

                const InsolationForm(title: AppConstants.insolation),

                Padding(
                  padding: const EdgeInsets.only(
                      left: 28.0, right: 28.0, bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      DividerLine(),
                      // 기간별 일사량 Form
                      InsolationByPeriodForm(
                          title: AppConstants.insolationByPeriod),
                      // 기간별 온도 Form
                      TempByPeriodForm(title: AppConstants.tempByPeriod),
                      // 기간별 습도 Form
                      HumidityByPeriodForm(
                          title: AppConstants.humidityByPeriod),
                      // 기간별 풍향 풍속 Form
                      WindByPeriodForm(title: AppConstants.windByPeriod),
                    ],
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
