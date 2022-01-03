import 'package:auto_size_text/auto_size_text.dart';
import 'package:capturestarmonitoring/app/constants/constants.dart';
import 'package:flutter/material.dart';

import '../components.dart';

class TempByPeriodForm extends StatefulWidget {
  final String? title;

  const TempByPeriodForm({@required this.title, Key? key})
      : super(key: key);

  @override
  _TempByPeriodFormState createState() => _TempByPeriodFormState();
}

class _TempByPeriodFormState extends State<TempByPeriodForm> {
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
                child: VerticalBarChart(title: runtimeType.toString(), colors: AppThemes.yellow),
              ),
            ],
          ),
        ),
        const DividerLine(),
      ],
    );
  }
}
