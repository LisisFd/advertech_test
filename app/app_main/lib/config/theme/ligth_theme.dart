import 'package:app_main/config/config.dart';
import 'package:flutter/material.dart';

final class LightTheme extends BaseTheme {
  const LightTheme({
    super.brightness = Brightness.light,
    super.colorPallet = const ColorPallet(
      iconFormBackground: Color(0xFFFFF5E9),
      iconForm: Color(0xFFE5BE90),
    ),
  });

  @override
  ThemeData getTheme() {
    const ColorScheme colorScheme =
        ColorScheme.light(background: ThemeConstatnts.backgroundLigth);

    return ThemeData(
      colorScheme: colorScheme,
      appBarTheme: appBarTheme,
      useMaterial3: true,
      textTheme: textTheme,
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(
            Color(0xFF986D8E),
          ),
          padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(vertical: 15),
          ),
          textStyle: MaterialStatePropertyAll<TextStyle>(
            TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
        ),
      ),
      inputDecorationTheme: inputDecorationTheme,
    );
  }

  @override
  TextTheme get textTheme => const TextTheme(
        titleLarge: TextStyle(
          color: Colors.black,
          fontSize: 55,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        labelMedium: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w300,
        ),
        labelLarge: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w300,
        ),
        bodyLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        bodyMedium: TextStyle(color: Colors.black, fontSize: 15),
      );
}
