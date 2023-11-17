import 'package:app_main/config/theme/theme_constants.dart';
import 'package:flutter/material.dart';

import 'i_theme.dart';

final class DarkTheme extends BaseTheme {
  const DarkTheme({super.brightness = Brightness.dark});

  @override
  ThemeData getTheme() {
    const ColorScheme colorScheme = ColorScheme.dark(background: Colors.black);
    return ThemeData(
      colorScheme: colorScheme,
      appBarTheme: appBarTheme,
      useMaterial3: true,
      textTheme: textTheme,
      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
          foregroundColor:
              MaterialStatePropertyAll<Color>(ThemeConstatnts.cardDark),
          backgroundColor:
              MaterialStatePropertyAll<Color>(ThemeConstatnts.iconDark),
        ),
      ),
      iconTheme: const IconThemeData(
        color: ThemeConstatnts.iconDark,
      ),
      cardTheme: const CardTheme(
        elevation: 0,
        color: ThemeConstatnts.cardDark,
      ),
    );
  }
}
