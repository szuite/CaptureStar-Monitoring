import 'package:auto_size_text/auto_size_text.dart';
import 'package:capturestarmonitoring/constants/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/*
   발전량 Form UI (GridView)

   일 발전량, 주 발전량, 월 발전량, 년 발전량 - 4가지 항목
*/

final pwrItem = {
  "item": [
    {"image": "assets/images/gear.png", "name": "일 발전량"},
    {"image": "assets/images/gear.png", "name": "주 발전량"},
    {"image": "assets/images/gear.png", "name": "월 발전량"},
    {"image": "assets/images/gear.png", "name": "년 발전량"},
  ]
};

class PowerGenerationGridView extends StatelessWidget {
  const PowerGenerationGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SizedBox(
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.95,
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 22,
        ),
        itemBuilder: (context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          color: AppThemes.blue10,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 9.0, vertical: 9.0),
                          child: SvgPicture.asset(
                            'assets/images/calendar.svg',
                            fit: BoxFit.scaleDown,
                            color: AppThemes.dodgerBlue,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        '일 발전량',
                        style: theme.bodyText1,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 12.0, right: 12.0, bottom: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          AutoSizeText(
                            '12,543 kWh',
                            maxLines: 1,
                            minFontSize: 8.0,
                            style: theme.headline3?.copyWith(fontSize: 24.0),
                          ),
                          const Expanded(child: SizedBox()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText('설치용량 대비',
                                  minFontSize: 14.0,
                                  maxLines: 1,
                                  style: theme.bodyText1
                                      ?.copyWith(fontSize: 14.0)),
                              AutoSizeText('100%',
                                  minFontSize: 14.0,
                                  maxLines: 1,
                                  style: theme.headline4
                                      ?.copyWith(color: AppThemes.cyan))
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText(
                                  '일 평균 대비',
                                  minFontSize: 14.0,
                                  maxLines: 1,
                                  style: theme.bodyText1?.copyWith(fontSize: 14.0),
                                ),
                                AutoSizeText(
                                  '80%',
                                  minFontSize: 14.0,
                                  maxLines: 1,
                                  style: theme.headline4?.copyWith(
                                      color: AppThemes.cyan),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
