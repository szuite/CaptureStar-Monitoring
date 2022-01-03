import 'package:auto_size_text/auto_size_text.dart';
import 'package:capturestarmonitoring/app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'custom_decorations.dart';

// 발전 현황 Page -> 발전현황 요약

class DevelopmentStatusSummary extends StatelessWidget {
  const DevelopmentStatusSummary({Key? key}) : super(key: key);

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
                  '발전현황 요약',
                  style: theme.headline3,
                ),
                const Expanded(child: SizedBox()),
                SvgPicture.asset(
                  'assets/images/face/smile.svg',
                  width: 20,
                  height: 20,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '양호',
                  style: theme.headline4
                      ?.copyWith(color: AppThemes.green),
                )
              ],
            ),
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 26.0, right: 26.0, top: 25.0, bottom: 20.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.8,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                        top: 10.0,
                        bottom: 15.0),
                    decoration: BoxDecoration(
                      color: AppThemes.white,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                            color: AppThemes.boxShadowColor.withOpacity(0.08),
                            spreadRadius: 0,
                            blurRadius: 12,
                            offset: const Offset(0, 4)
                        ),
                      ],
                    ),
                    child: GridTile(
                      header: Container(
                        decoration: const BoxDecoration(
                          color: AppThemes.blue10,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                        ),
                        height: 40,
                        child: GridTileBar(
                          subtitle: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/check.svg',
                                width: 20,
                                height: 20,
                                fit: BoxFit.scaleDown,
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              const AutoSizeText(
                                '정상',
                                maxLines: 1,
                                maxFontSize: double.infinity,
                                minFontSize: 16.0,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 12.0,
                          right: 12.0,
                          top: 48.0,
                          bottom: 16.0,
                        ),
                        child: Center(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/clock.svg',
                                    width: 20,
                                    height: 20,
                                    fit: BoxFit.scaleDown,
                                    color: AppThemes.blue,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '일 발전량',
                                    style: theme.bodyText1,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 28,
                              ),
                              Text(
                                '479 kWh',
                                style: theme.headline3,
                              ),
                              const Expanded(child: SizedBox()),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  AutoSizeText('설치용량 대비',
                                      minFontSize: 14.0,
                                      maxLines: 1,
                                      style: theme.bodyText1
                                          ?.copyWith(
                                          fontSize: 14.0)),
                                  AutoSizeText('100%',
                                      minFontSize: 14.0,
                                      maxLines: 1,
                                      style: theme.headline4
                                          ?.copyWith(
                                          color:
                                          AppThemes.cyan))
                                ],
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    AutoSizeText(
                                      '일 평균 대비',
                                      minFontSize: 14.0,
                                      maxLines: 1,
                                      style: theme.bodyText1
                                          ?.copyWith(
                                          fontSize: 14.0),
                                    ),
                                    AutoSizeText(
                                      '80%',
                                      minFontSize: 14.0,
                                      maxLines: 1,
                                      style: theme.headline4
                                          ?.copyWith(
                                          color:
                                          AppThemes.cyan),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
