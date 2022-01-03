import 'package:flutter/material.dart';
import 'package:capturestarmonitoring/app/constants/constants.dart';

class DatePickerButtonStyle {
  DatePickerButtonStyle._();

  static ButtonStyle get outlinedButton => TextButton.styleFrom(
    primary: AppThemes.blackPearl,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
      side: const BorderSide(color: AppThemes.textButtonBorderColor, width: 1.5),
    ),
    textStyle: AppThemes.lightTheme.textTheme.headline4?.copyWith(fontSize: 12.0),
    minimumSize: Size.zero,
    padding: const EdgeInsets.all(5.0),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );
}