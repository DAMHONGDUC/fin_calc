import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fin_calc/main_app.dart';
import 'package:fin_calc/src/di/injector.dart';
import 'package:system_design_flutter/index.dart';

import 'src/core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  await initialisation();

  const appTranslation = SdTranslation(
    supportedLocales: [Locale('en'), Locale('vi')],
    path: "lib/src/core/translations",
    defaultLocale: Locale('en'),
    languageCodes: ["en", "vi"],
  );

  runApp(
    EasyLocalization(
      path: appTranslation.path,
      supportedLocales: appTranslation.supportedLocales,
      startLocale: appTranslation.defaultLocale,
      child: MainApp(savedThemeMode: savedThemeMode),
    ),
  );
}

Future<void> initialisation() async {
  try {
    // di
    configureDependencies();

    // bloc observer
    Bloc.observer = SdBlocObserver();

    // easy location
    await EasyLocalization.ensureInitialized();

    // set up app router
    NavigationManager.instance;
  } catch (e, stackTrace) {
    SdLog.e('Initialization Error: $e', stackTrace);
  }
}
