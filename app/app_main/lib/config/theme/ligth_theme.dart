import 'package:app_main/config/theme/theme_constants.dart';
import 'package:flutter/material.dart';

import 'i_theme.dart';

final class LightTheme extends BaseTheme {
  const LightTheme({super.brightness = Brightness.light});

  @override
  ThemeData getTheme() {
    const ColorScheme colorScheme =
        ColorScheme.light(background: ThemeConstatnts.backgroundLigth);

    return ThemeData(
      colorScheme: colorScheme,
      appBarTheme: appBarTheme,
      useMaterial3: true,
      textTheme: textTheme,
      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
          foregroundColor:
              MaterialStatePropertyAll<Color>(ThemeConstatnts.cardLigth),
          backgroundColor:
              MaterialStatePropertyAll<Color>(ThemeConstatnts.iconLigth),
        ),
      ),
      iconTheme: const IconThemeData(
        color: ThemeConstatnts.iconLigth,
      ),
      cardTheme: const CardTheme(
        elevation: 0,
        color: ThemeConstatnts.cardLigth,
      ),
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
          fontSize: 25,
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
