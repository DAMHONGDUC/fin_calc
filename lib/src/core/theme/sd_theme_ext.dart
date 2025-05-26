import 'package:flutter/material.dart';

import 'app_theme.dart';

extension SdThemeExtension on BuildContext {
  AppTheme get appTheme => Theme.of(this).extension<AppTheme>()!;
}
