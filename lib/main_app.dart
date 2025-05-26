import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:fin_calc/src/core/core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key, this.savedThemeMode});
  final AdaptiveThemeMode? savedThemeMode;

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: CustomTheme.lightTheme,
      dark: CustomTheme.darkTheme,
      initial: savedThemeMode ?? AdaptiveThemeMode.system,
      builder:
          (theme, darkTheme) => ScreenUtilInit(
            designSize: AppConstants.designSize,
            minTextAdapt: true,
            splitScreenMode: true,
            child: CustomMaterialApp(darkTheme: darkTheme, theme: theme),
          ),
    );
  }
}
