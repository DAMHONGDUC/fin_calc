import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:fin_calc/src/core/core.dart';
import 'package:fin_calc/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:system_design_flutter/index.dart';

class CustomMaterialApp extends StatelessWidget {
  final ThemeData theme;
  final ThemeData darkTheme;

  const CustomMaterialApp({
    required this.theme,
    required this.darkTheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Change android Android Navigation Bar Color base on current brighness
    Helper.changeAndroidNavigationBarColor(
      nextThemeMode: AdaptiveTheme.of(context).mode,
      systemBrightness: MediaQuery.of(context).platformBrightness,
      delayMs: 0,
    );

    return SdKeyboardDismisser(
      child: MaterialApp.router(
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: darkTheme,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routerConfig: NavigationManager.router,
      ),
    );
  }
}
