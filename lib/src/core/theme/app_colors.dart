import 'package:color_shade/color_shade.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class AppColors {
  static const Color primary = Color(0xFF3674B5);
  static final Color primary50 = primary.shade50;
  static final Color primary100 = primary.shade100;
  static final Color primary200 = primary.shade200;
  static final Color primary300 = primary.shade300;
  static final Color primary400 = primary.shade400;
  static final Color primary500 = primary.shade500;
  static final Color primary600 = primary.shade600;
  static final Color primary700 = primary.shade700;
  static final Color primary800 = primary.shade800;
  static final Color primary900 = primary.shade900;

  static const Color primaryLight = SdColors.white;
  static const Color secondaryLight = Color(0xFFf9faff);

  static const Color primaryDark = Color(0xFF111419);
  static const Color secondaryDark = Color(0xFF1c232b);
}
