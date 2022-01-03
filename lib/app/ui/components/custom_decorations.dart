
import 'package:capturestarmonitoring/app/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomDecorations {
  static BoxDecoration roundFrameBox({required double radius, required double opacity, required double blurRadius}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: AppThemes.white,
      boxShadow: [
        BoxShadow(
          color: AppThemes.boxShadowColor.withOpacity(opacity),
          blurRadius: blurRadius,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  static BoxDecoration userFrameBox() {
    return BoxDecoration(
      color: AppThemes.white,
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: [
        BoxShadow(
          color: AppThemes.boxShadowColor.withOpacity(0.08),
          spreadRadius: 0,
          blurRadius: 32,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  static BoxDecoration rangeFrameBox({required Color color}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8.0),
    );
  }
}