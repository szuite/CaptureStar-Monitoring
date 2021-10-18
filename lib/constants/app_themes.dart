import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  static const Color dodgerBlue = Color.fromRGBO(29, 161, 242, 1);
  static const Color whiteLilac = Color.fromRGBO(249, 249, 249, 1.0);
  
  static const Color titleColor = Color.fromRGBO(30, 45, 65, 1.0);

  static String sansFont = "ProductSans";
  static String robotoFont = "Roboto";

  // main color
  static const Color _lightPrimaryColor = dodgerBlue;

  // background colors
  static const Color _lightBackgroundColor = whiteLilac;
  static const Color _lightBackgroundAppBarColor = _lightPrimaryColor;

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: robotoFont,
    scaffoldBackgroundColor: _lightBackgroundColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: _lightPrimaryColor,
    ),
  );
}