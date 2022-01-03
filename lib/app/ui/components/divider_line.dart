import 'package:flutter/material.dart';
import 'package:capturestarmonitoring/app/constants/constants.dart';

class DividerLine extends StatelessWidget {
  const DividerLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      color: AppThemes.dividerColor,
      height: 2,
    );
  }
}
