import 'package:capturestarmonitoring/app/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/components.dart';

// 발전 현황 페이지

class DevelopmentStatusPage extends StatelessWidget {
  const DevelopmentStatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MainTitle(title: AppConstants.developmentStatus),
                const SizedBox(
                  height: 28,
                ),
                const DevelopmentStatusSummary(),

                //const CircleBoxForm(title: '발전현황 요약'),

                Padding(
                  padding: const EdgeInsets.only(
                      left: 28.0, right: 28.0, top: 28.0, bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      // 인버터별 발전량 Form
                      PowerGenerationInverterForm(title: AppConstants.pwrGenerationByInverter),
                      // 기간별 발전량 Form
                      PowerGenerationPeriodForm(title: AppConstants.pwrGenerationByPeriod),
                      // 커스텀 콤보 차트 Form
                      CustomComboChartForm(title: AppConstants.customComboChart),
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
