import 'package:flutter/cupertino.dart';

final class ThemeConstatnts {
  /// All constants colors in dark theme is a сomplementary light theme colors
  ///
  /// See more: https://www.canva.com/colors/color-wheel/
  ///
  /// Example:
  /// backgroundLight = Color(0xFFFFFFFF) -> backgroundDark = Color(0x0000000)

  const ThemeConstatnts._();
  static const double appWidth = 390.0;
  static const backgroundLigth = Color(0xFFFFFFFF);
  static const backgroundDark = Color(0x00000000);
  static const cardLigth = Color(0xFFFFEFEF);
  static const cardDark = Color(0xFFEFFFFF);
  static const iconLigth = Color(0xFF53538A);
  static const iconDark = Color(0xFF8A8A53);
  static const EdgeInsets defaultCardPadding =
      EdgeInsets.symmetric(vertical: 20, horizontal: 10);
}
