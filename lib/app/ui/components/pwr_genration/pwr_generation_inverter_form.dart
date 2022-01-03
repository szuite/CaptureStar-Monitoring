import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../components.dart';

class PowerGenerationInverterForm extends StatelessWidget {
  const PowerGenerationInverterForm({required this.title, Key? key}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          title!,
          minFontSize: 16.0,
          maxFontSize: double.infinity,
          style: theme.headline4,
        ),

        const SizedBox(
          height: 20,
        ),

        // 인버터별 발전량 꺾은선 차트
        Container(
          decoration: CustomDecorations.roundFrameBox(
              radius: 16.0, opacity: 0.08, blurRadius: 32.0),
          padding: const EdgeInsets.all(5.0),
          width: double.infinity,
          height: 245,
          child: const VerticalLineChart(),
        ),

        const DividerLine(),
      ],
    );
  }
}
