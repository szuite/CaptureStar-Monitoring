import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:capturestarmonitoring/app/constants/constants.dart';

import '../components.dart';

class PowerGenerationPeriodForm extends StatefulWidget {
  final String? title;

  const PowerGenerationPeriodForm({required this.title, Key? key})
      : super(key: key);

  @override
  PowerGenerationPeriodFormState createState() =>
      PowerGenerationPeriodFormState();
}

class PowerGenerationPeriodFormState extends State<PowerGenerationPeriodForm> {
  // 사용자가 일별, 기간별을 선택하는 flag 변수 (초기값 : 일별)
  String flag = 'Daily';

  @override
  Widget build(BuildContext context) {
    print('PwrGenerationPeriodForm');
    // 사용자가 일별, 기간별 둘 중 하나를 선택, 반환하는 callback 함수
    refresh(String value){
      setState(() {
        flag = value;
      });
    }

    final theme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          widget.title!,
          minFontSize: 16.0,
          maxFontSize: double.infinity,
          style: theme.headline4,
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: CustomDecorations.roundFrameBox(
              radius: 16.0, opacity: 0.08, blurRadius: 32.0),
          width: double.infinity,
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, bottom: 20.0, top: 10.0),
          child: Column(
            children: [
              // 일별, 기간별 날짜 선택 Form
              DatePickerForm(title: runtimeType.toString(), notifyParent: refresh),

              SizedBox(
                height: 230,
                child: VerticalBarChart(title: runtimeType.toString(), flag: flag, colors: AppThemes.barChartColor),
              ),
            ],
          ),
        ),
        const DividerLine(),
      ],
    );
  }
}
