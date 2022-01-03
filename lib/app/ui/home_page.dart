import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'package:capturestarmonitoring/app/constants/constants.dart';
import 'components/components.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final double _value = 50;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 28, top: 40, right: 28, bottom: 34),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Home 제목
                  AutoSizeText(
                    'Home',
                    style: theme.headline2,
                  ),

                  const SizedBox(
                    height: 28,
                  ),

                  // 아파트, User 데이터 출력 Form
                  const UserDataForm(),

                  const SizedBox(
                    height: 28,
                  ),

                  AutoSizeText(
                    '발전현황',
                    style: theme.headline3,
                  ),

                  // 발전현황 Form
                  Container(
                    height: 210,
                    padding: const EdgeInsets.only(top: 50),
                    child: SfRadialGauge(axes: <RadialAxis>[
                      RadialAxis(
                        minimum: 0,
                        maximum: 100,
                        labelsPosition: ElementsPosition.outside,
                        showTicks: false,
                        showLabels: false,
                        startAngle: 180,
                        endAngle: 0,
                        canScaleToFit: true,
                        radiusFactor: 1.6,
                        axisLineStyle: const AxisLineStyle(
                          thickness: 0.15,
                          color: AppThemes.circularChartColor,
                          thicknessUnit: GaugeSizeUnit.factor,
                          cornerStyle: CornerStyle.bothCurve,
                        ),
                        pointers: <GaugePointer>[
                          RangePointer(
                              value: _value,
                              width: 0.15,
                              gradient: customGradient(_value),
                              sizeUnit: GaugeSizeUnit.factor,
                              cornerStyle: CornerStyle.bothCurve,
                              enableAnimation: true,
                              animationDuration: 20,
                              animationType: AnimationType.linear)
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                            angle: 183,
                            positionFactor: 1.18,
                            widget: SvgPicture.asset(
                              'assets/images/weather/half_moon.svg',
                              fit: BoxFit.cover,
                              height: 30,
                              width: 30,
                              color: const Color.fromRGBO(253, 200, 33, 1.0),
                            ),
                          ),
                          GaugeAnnotation(
                            angle: -3,
                            positionFactor: 1.18,
                            widget: SvgPicture.asset(
                              'assets/images/weather/sun_1.svg',
                              fit: BoxFit.cover,
                              height: 25,
                              width: 25,
                              color: const Color.fromRGBO(253, 200, 33, 1.0),
                            ),
                          ),
                          GaugeAnnotation(
                            widget: Column(
                              children: <Widget>[
                                Text(
                                  '현재 전체',
                                  style: theme.bodyText1,
                                ),
                                const SizedBox(
                                  height: 12.0,
                                ),
                                Text('${_value.toInt().toString()} kWh',
                                    style: theme.headline2
                                        ?.copyWith(fontSize: 24.0)),
                              ],
                            ),
                            angle: 90,
                            verticalAlignment: GaugeAlignment.center,
                          ),
                        ],
                      ),
                    ]),
                  ),

                  Center(
                    child: SizedBox(
                      width: 146,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText(
                                '설치용량 대비',
                                style: theme.bodyText1,
                              ),
                              AutoSizeText(
                                '86%',
                                style: theme.bodyText1?.copyWith(fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText(
                                '어제 대비',
                                style: theme.bodyText1,
                              ),
                              AutoSizeText(
                                '101%',
                                style: theme.bodyText1?.copyWith(fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 32,
                  ),

                  const PowerGenerationGridView(),

                  const SizedBox(
                    height: 28,
                  ),

                  const Text(
                    '기상정보',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppThemes.black30,
                        fontFamily: 'Roboto'),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // 기상정보 Form
                  const WeatherInfoForm(),

                  const DividerLine(),

                  const AutoSizeText(
                    '변환현황',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppThemes.black30,
                        fontFamily: 'Roboto'),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // 변환현황 Form
                  const ConversionStatusForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

SweepGradient customGradient(double value) {
  List<Color> colors = [
    AppThemes.blue,
    AppThemes.cyan,
    AppThemes.yellow,
    AppThemes.pink
  ];

  if (value <= 10) {
    return SweepGradient(
        colors: colors.sublist(0, 1), stops: const <double>[0.5]);
  } else if (value > 10 && value <= 40) {
    return SweepGradient(
        colors: colors.sublist(0, 2), stops: const <double>[0.5, 1.0]);
  } else if (value > 40 && value <= 70) {
    return SweepGradient(
        colors: colors.sublist(0, 3), stops: const <double>[0.2, 0.6, 0.9]);
  } else if (value > 70) {
    return SweepGradient(
        colors: colors.sublist(0, 4),
        stops: const <double>[0.2, 0.5, 0.7, 0.9]);
  }

  return const SweepGradient(colors: [
    AppThemes.blue,
    AppThemes.cyan,
    AppThemes.yellow,
  ], stops: <double>[
    0.2,
    0.5,
    0.7
  ]);
}
