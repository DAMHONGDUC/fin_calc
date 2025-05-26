import 'dart:io';

import 'package:fin_calc/src/core/core.dart';
import 'package:flutter/services.dart';
import 'package:system_design_flutter/index.dart';

class Helper {
  static Future delay({int seconds = 2}) async {
    await Future.delayed(Duration(seconds: seconds));
  }

  static changeAndroidNavigationBarColor({
    required bool isDark,
    int delayMs = 270,
  }) {
    if (!Platform.isAndroid) {
      return;
    }

    SdHelper.delay(
      milliseconds: delayMs,
      action:
          () => SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(
              systemNavigationBarColor:
                  isDark ? AppColors.primaryDark : AppColors.primaryLight,
              systemNavigationBarIconBrightness:
                  isDark ? Brightness.dark : Brightness.light,
            ),
          ),
    );
  }
}
