import 'package:flutter/material.dart';
import 'components.dart';

class ConversionStatusSummary extends StatelessWidget {
  const ConversionStatusSummary({Key? key}) : super(key: key);

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
              bottom: 28.0,
            ),
            child: Text(
              '변환통계 요약',
              style: theme.headline3,
            ),
          ),
          const SizedBox(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 28.0, right: 28.0, bottom: 20.0),
              child: ConversionStatusForm(),
            ),
          ),
        ],
      ),
    );
  }
}
