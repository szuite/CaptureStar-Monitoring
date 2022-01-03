import 'package:auto_size_text/auto_size_text.dart';
import 'package:capturestarmonitoring/app/constants/constants.dart';
import 'package:capturestarmonitoring/app/controller/weather_controller.dart';
import 'package:capturestarmonitoring/app/data/model/open_weather_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

final weatherIcon = {
  'assets/images/temperature.svg',
  'assets/images/humidity.svg',
  'assets/images/wind.svg',
  'assets/images/wind_direction.svg',
};

final weatherItem = {'온도', '습도', '풍속', '풍향'};
final weatherData = {'50', '15', '15m/s', '서'};

// 기상정보 내부 화면

class WeatherInfoForm extends StatelessWidget {
  const WeatherInfoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //WeatherController controller = Get.find();
    //controller.getWeather(lat: 100, lon: 50);

    final theme = Theme.of(context).textTheme;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 5.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 0.2,
                    blurRadius: 5,
                    offset: const Offset(0.2, 5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SvgPicture.asset(
                      'assets/images/weather/sun.svg',
                      width: 60,
                      height: 60,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          '현재 일사량',
                          minFontSize: 12.0,
                          style: theme.headline4?.copyWith(fontSize: 16.0),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        AutoSizeText(
                          '1.9k w/m2',
                          minFontSize: 20.0,
                          style: theme.headline2?.copyWith(fontSize: 24.0),
                        ),
                      ],
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/face/smile.svg',
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Text(
                              '양호',
                              style: TextStyle(
                                  color: AppThemes.green,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Roboto'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 0.2,
                  blurRadius: 5,
                  offset: const Offset(0.2, 5),
                ),
              ],
            ),
         /*   child: Row(
              children: [
                Text('11'),
                Text('11')
              ],
            )*/
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.8,
                crossAxisCount: 4,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 0.2,
                          blurRadius: 5,
                          offset: const Offset(0.2, 5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                            weatherIcon.elementAt(index),
                            fit: BoxFit.scaleDown,
                            color: Colors.black,
                            height: 20,
                            width: 20,
                          ),

                       /*     Obx(() {
                            return Text(controller.weatherModel.value.main!.temp.toString());
                          }
                          ),*/
                          Text(weatherItem.elementAt(index), style: theme.bodyText2?.copyWith(color: AppThemes.subTextColor)),
                          Text(weatherData.elementAt(index), style: theme.bodyText2?.copyWith(fontSize: 14.0, fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
