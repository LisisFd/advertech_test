import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color/color.dart';

abstract interface class ITheme {
  final Brightness brightness;
  final ColorPallet colorPallet;
  const ITheme({
    required this.brightness,
    required this.colorPallet,
  });
  ThemeData getTheme();
}

abstract base class BaseTheme extends ITheme {
  const BaseTheme({
    required super.brightness,
    required super.colorPallet,
  });

  AppBarTheme get appBarTheme => AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: brightness,
        ),
      );
  InputDecorationTheme get inputDecorationTheme => const InputDecorationTheme(
        labelStyle: TextStyle(
          color: Color(0xFF8D91A0),
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF8D91A0),
          ),
        ),
      );
  TextTheme get textTheme => const TextTheme(
        titleLarge: TextStyle(
          color: Colors.white,
          fontSize: 55,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        labelMedium: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w300,
        ),
        labelLarge: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
        bodyLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        bodyMedium: TextStyle(color: Colors.white, fontSize: 15),
      );
}
