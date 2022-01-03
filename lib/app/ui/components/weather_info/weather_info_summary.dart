import 'package:flutter/material.dart';
import 'weather_info.dart';
import '../components.dart';

// 기상정보 요약 위젯

class WeatherInfoSummary extends StatelessWidget {
  const WeatherInfoSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: CustomDecorations.roundFrameBox(radius: 32.0, opacity: 0.3, blurRadius: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 28.0,
              right: 28.0,
              top: 20.0,
            ),
            child: Row(
              children: [
                Text(
                  '기상정보 요약',
                  style: theme.headline3,
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 28.0, bottom: 20.0),
            child: WeatherInfoForm(),
          )
        ],
      ),
    );
  }
}
