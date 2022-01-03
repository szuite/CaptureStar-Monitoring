import 'package:auto_size_text/auto_size_text.dart';
import 'package:capturestarmonitoring/app/constants/constants.dart';
import 'package:flutter/material.dart';

import 'components/components.dart';

// 변환 통계 페이지

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MainTitle(title: '변환 통계'),

                const SizedBox(
                  height: 28,
                ),

                const ConversionStatusSummary(),

                Padding(
                  padding: const EdgeInsets.only(
                      left: 28.0, right: 28.0, top: 28.0, bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        '일별 변환 효율',
                        minFontSize: 16.0,
                        maxFontSize: double.infinity,
                        style: theme.headline4,
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: AppThemes.white,
                            boxShadow: [
                              BoxShadow(
                                  color: AppThemes.boxShadowColor
                                      .withOpacity(0.08),
                                  spreadRadius: 0,
                                  blurRadius: 32,
                                  offset: const Offset(0, 4)),
                            ]),
                        width: double.infinity,
                        height: 245,
                        child: const VerticalLineChart(),
                      ),

                      const DividerLine(),

                      AutoSizeText(
                        '기간별 변환 효율',
                        minFontSize: 16.0,
                        maxFontSize: double.infinity,
                        style: theme.headline4,
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: AppThemes.white,
                            boxShadow: [
                              BoxShadow(
                                  color: AppThemes.boxShadowColor
                                      .withOpacity(0.08),
                                  spreadRadius: 0,
                                  blurRadius: 32,
                                  offset: const Offset(0, 4)),
                            ]),
                        width: double.infinity,
                        height: 245,
                        child: const VerticalLineChart(),
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
  }
}
