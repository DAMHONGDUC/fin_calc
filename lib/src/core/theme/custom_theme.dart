import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';

import 'app_theme.dart';

class CustomTheme {
  static const fontFamily = "Roboto";
  static const moonSizeRatio = 1.25;

  static final dark = AppTheme.dark();
  static final light = AppTheme.light();

  static final lightTokens = MoonTokens.light.copyWith(
    colors: MoonColors.light.copyWith(
      piccolo: light.primary,
      textPrimary: light.inputColor,
    ),
    sizes: const MoonSizes(
      x6s: 2 * moonSizeRatio,
      x5s: 4 * moonSizeRatio,
      x4s: 8 * moonSizeRatio,
      x3s: 12 * moonSizeRatio,
      x2s: 16 * moonSizeRatio,
      xs: 24 * moonSizeRatio,
      sm: 32 * moonSizeRatio,
      md: 40 * moonSizeRatio,
      lg: 48 * moonSizeRatio,
      xl: 56 * moonSizeRatio,
      x2l: 64 * moonSizeRatio,
    ),
  );

  static final darkTokens = MoonTokens.light.copyWith(
    colors: MoonColors.light.copyWith(
      piccolo: dark.primary,
      textPrimary: dark.inputColor,
    ),
    sizes: const MoonSizes(
      x6s: 2 * moonSizeRatio,
      x5s: 4 * moonSizeRatio,
      x4s: 8 * moonSizeRatio,
      x3s: 12 * moonSizeRatio,
      x2s: 16 * moonSizeRatio,
      xs: 24 * moonSizeRatio,
      sm: 32 * moonSizeRatio,
      md: 40 * moonSizeRatio,
      lg: 48 * moonSizeRatio,
      xl: 56 * moonSizeRatio,
      x2l: 64 * moonSizeRatio,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: fontFamily,
    extensions: [light, MoonTheme(tokens: CustomTheme.lightTokens)],
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: fontFamily,
    extensions: [dark, MoonTheme(tokens: CustomTheme.darkTokens)],
  );
}
