import 'package:flutter/material.dart';

import 'color/color.dart';
import 'i_theme.dart';

final class DarkTheme extends BaseTheme {
  const DarkTheme({
    super.brightness = Brightness.dark,
    super.colorPallet = const ColorPallet(
      iconFormBackground: Color(0xFFE8F8FF),
      iconForm: Color(0xFF91CCE6),
    ),
  });

  @override
  ThemeData getTheme() {
    const ColorScheme colorScheme = ColorScheme.dark(background: Colors.black);
    return ThemeData(
      colorScheme: colorScheme,
      appBarTheme: appBarTheme,
      useMaterial3: true,
      textTheme: textTheme,
      inputDecorationTheme: inputDecorationTheme,
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(
            Color(0xFF76996E),
          ),
          textStyle: MaterialStatePropertyAll<TextStyle>(
            TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          foregroundColor: MaterialStatePropertyAll<Color>(Colors.black),
        ),
      ),
    );
  }
}
