import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:fin_calc/src/core/core.dart';
import 'package:flutter/services.dart';
import 'package:system_design_flutter/index.dart';

class Helper {
  static Future delay({int seconds = 2}) async {
    await Future.delayed(Duration(seconds: seconds));
  }

  static changeAndroidNavigationBarColor({
    required AdaptiveThemeMode nextThemeMode,
    required Brightness systemBrightness,
    int delayMs = 270,
  }) {
    if (!Platform.isAndroid) {
      return;
    }

    Color navigationBarColor = AppColors.primaryLight;
    Brightness? brightness = Brightness.light;

    if (nextThemeMode.isDark) {
      navigationBarColor = AppColors.primaryDark;
      brightness = Brightness.dark;
    } else if (nextThemeMode.isLight) {
      navigationBarColor = AppColors.primaryLight;
      brightness = Brightness.light;
    } else if (nextThemeMode.isSystem) {
      navigationBarColor =
          systemBrightness == Brightness.dark
              ? AppColors.primaryDark
              : AppColors.primaryLight;
      brightness = systemBrightness;
    }

    SdHelper.delay(
      milliseconds: delayMs,
      action:
          () => SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(
              systemNavigationBarColor: navigationBarColor,
              systemNavigationBarIconBrightness: brightness,
            ),
          ),
    );
  }
}
