import 'package:auto_size_text/auto_size_text.dart';
import 'package:capturestarmonitoring/app/constants/constants.dart';
import 'package:flutter/material.dart';

import '../custom_decorations.dart';
import '../date_picker_form.dart';
import '../vertical_bar_chart.dart';

class CustomComboChartForm extends StatefulWidget {
  final String? title;

  const CustomComboChartForm({required this.title, Key? key}) : super(key: key);

  @override
  _CustomComboChartFormState createState() => _CustomComboChartFormState();
}

class _CustomComboChartFormState extends State<CustomComboChartForm> {
  // 사용자가 일별, 기간별을 선택하는 flag 변수 (초기값 : 일별)
  String flag = 'Daily';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    // 사용자가 일별, 기간별 둘 중 하나를 선택, 반환하는 callback 함수
    callback(String value){
      setState(() {
        flag = value;
      });
    }

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
              left: 20.0, right: 20.0, bottom: 15.0, top: 10.0),
          child: Column(
            children: [
              // 일별, 기간별 날짜 선택 Form
              DatePickerForm(title: runtimeType.toString(), notifyParent: callback,),

              SizedBox(
                height: 230,
                child: VerticalBarChart(title: runtimeType.toString(), flag: flag, colors:
                    AppThemes.barChartColor),
              ),

              const SizedBox(
                height: 20,
              ),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('막대차트 설정'),
                      style: ElevatedButton.styleFrom(
                        onPrimary: AppThemes.white,
                        textStyle: theme.subtitle2,
                        primary: AppThemes.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('꺾은선차트 설정'),
                      style: ElevatedButton.styleFrom(
                        onPrimary: AppThemes.white,
                        textStyle: theme.subtitle2,
                        primary: AppThemes.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
