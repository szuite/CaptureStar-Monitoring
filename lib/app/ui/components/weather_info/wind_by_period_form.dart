import 'package:auto_size_text/auto_size_text.dart';
import 'package:capturestarmonitoring/app/constants/constants.dart';
import 'package:flutter/material.dart';

import '../custom_decorations.dart';
import '../date_picker_form.dart';
import '../vertical_bar_chart.dart';

class WindByPeriodForm extends StatefulWidget {
  final String? title;

  const WindByPeriodForm({@required this.title, Key? key})
      : super(key: key);

  @override
  _WindByPeriodFormState createState() => _WindByPeriodFormState();
}

class _WindByPeriodFormState extends State<WindByPeriodForm> {
  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
          child: Column(
            children: [
              // 일별, 기간별 날짜 선택 Form
              DatePickerForm(title: runtimeType.toString(),),

              SizedBox(
                height: 230,
                child: VerticalBarChart(colors: AppThemes.purple),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
