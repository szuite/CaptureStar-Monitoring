import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppThemes {
  AppThemes._();

  static const Color dodgerBlue = Color.fromRGBO(29, 161, 242, 1.0);
  static const Color whiteLilac = Color.fromRGBO(249, 249, 249, 1.0);
  static const Color blackPearl = Color.fromRGBO(30, 31, 43, 1);
  static const Color ebonyClay = Color.fromRGBO(40, 42, 58, 1);

  static const Color dark = Color.fromRGBO(18, 18, 18, 1.0);
  static const Color black30 = Color.fromRGBO(30, 45, 65, 1.0);

  static const Color blue10 = Color.fromRGBO(43, 139, 255, 0.10196078431372549);
  static const Color blue = Color.fromRGBO(43, 139, 255, 1.0);

  static const Color subTextColor = Color.fromRGBO(93, 100, 109, 1.0);

  static const Color cyan = Color.fromRGBO(37, 186, 189, 1.0);

  static String sansFont = "ProductSans";
  static String robotoFont = "Roboto";

  // Light Theme Color

  // Main Color
  static const Color _lightPrimaryColor = dodgerBlue;

  // Background Colors
  static const Color _lightBackgroundColor = whiteLilac;
  static const Color _lightBackgroundAppBarColor = _lightPrimaryColor;

  // Icon Color
  static const Color _lightIconColor = dodgerBlue;

  // Text color
  static const Color _lightPrimaryTextColor = black30;
  static const Color _lightTextColor = Colors.black;

  static const Color _lightButtonColor = Colors.white;
  static const Color green = Color.fromRGBO(109, 200, 86, 1.0);

  // Dark Theme Color

  // Main Color
  static const Color _darkPrimaryColor = dodgerBlue;

  // Background Colors
  static const Color _darkBackgroundColor = dark;
  static const Color _darkBackgroundAppBarkColor = _darkPrimaryColor;

  //Text Colors
  static const Color _darkTextColor = Colors.white;
  static const Color _darkAlertTextColor = Colors.black;
  static const Color _darkTextSecondaryColor = Colors.black;

  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: robotoFont,
    scaffoldBackgroundColor: _lightBackgroundColor,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: _lightTextColor),
      color: Colors.black54,
    ),
    textTheme: _lightTextTheme,

    colorScheme: const ColorScheme.light(
      primary: _lightPrimaryColor,
      primaryVariant: _lightBackgroundColor
    )
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: robotoFont,
    scaffoldBackgroundColor: _darkBackgroundColor,
    textTheme: _darkTextTheme,
  );

  // LightTextTheme
  static final TextTheme _lightTextTheme = TextTheme(
    headline1: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, fontFamily: robotoFont, color: _lightPrimaryTextColor),
    headline2: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, fontFamily: robotoFont, color: _lightPrimaryTextColor),
    headline3: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: robotoFont, color: _lightPrimaryTextColor),
    headline4: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, fontFamily: robotoFont, color: _lightPrimaryTextColor),

    bodyText1: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily: robotoFont, color: _lightPrimaryTextColor),
    bodyText2: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, fontFamily: robotoFont, color: _lightPrimaryTextColor),

    button: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, fontFamily: robotoFont, color: _lightButtonColor)
  );

  // DarkTextTheme
  static final TextTheme _darkTextTheme = TextTheme(
    headline1: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, fontFamily: robotoFont, color: _darkTextColor),
    headline2: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, fontFamily: robotoFont, color: _darkTextColor),
    headline3: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: robotoFont, color: _darkTextColor),
  );
}