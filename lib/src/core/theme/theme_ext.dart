import 'package:flutter/material.dart';

import 'app_theme.dart';

extension ThemeExtension on BuildContext {
  AppTheme get appTheme => Theme.of(this).extension<AppTheme>()!;
}
