import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static const primaryColor = const Color(0xFF009688);
  static const darkPrimaryColor = const Color(0xFF00796B);
  static const lightPrimaryColor = const Color(0xFFB2DFDB);
  static const accentColor = const Color(0xFF009688);
  static const primaryTextColor = const Color(0xFF212121);
  static const secondaryTextColor = const Color(0xFF757575);
  static const dividerColor = const Color(0xFFBDBDBD);

  static const Map<int, Color> colorPallet = {
    50: const Color.fromRGBO(0, 138, 123, .1),
    100: const Color.fromRGBO(0, 138, 123, .2),
    200: const Color.fromRGBO(0, 138, 123, .3),
    300: const Color.fromRGBO(0, 138, 123, .4),
    400: const Color.fromRGBO(0, 138, 123, .5),
    500: const Color.fromRGBO(0, 138, 123, .6),
    600: const Color.fromRGBO(0, 138, 123, .7),
    700: const Color.fromRGBO(0, 138, 123, .8),
    800: const Color.fromRGBO(0, 138, 123, .9),
    900: const Color.fromRGBO(0, 138, 123, 1),
  };
  const AppTheme._();

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: MaterialColor(0xFF009688, colorPallet),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static setNavigationAndStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xffDDDDDD),
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  static final textTheme = TextStyle(
    fontFamily: 'Poppins',
  );

  static final blodTextTheme = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
  );
}
