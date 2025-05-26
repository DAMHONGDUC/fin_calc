import 'package:fin_calc/src/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class AppTheme extends ThemeExtension<AppTheme> {
  final Color bgPrimary;
  final Color bgSecondary;
  final Color inputBg;
  final Color inputBorder;
  final Color inputCursor;
  final Color iconPrimary;
  final Color cardBgHighlight;
  final Color iconSecondary;
  final Color textPrimary;
  final Color textSecondary;
  final Color primary;
  final Color appbarShadow;
  final Color containerShadow;
  final Color iconBg;
  final Color inputColor;
  final Color? inputHint;
  final Color? inputActiveBorder;
  final Color? bgCard;

  AppTheme({
    required this.bgPrimary,
    required this.bgSecondary,
    required this.inputBg,
    required this.inputBorder,
    required this.inputCursor,
    required this.iconPrimary,
    required this.cardBgHighlight,
    required this.iconSecondary,
    required this.textPrimary,
    required this.textSecondary,
    required this.primary,
    required this.appbarShadow,
    required this.containerShadow,
    required this.iconBg,
    required this.inputColor,
    required this.inputHint,
    required this.inputActiveBorder,
    required this.bgCard,
  });

  // light
  static AppTheme light() {
    return AppTheme(
      primary: AppColors.primary,

      // bg
      bgPrimary: AppColors.primaryLight,
      bgSecondary: AppColors.secondaryLight,

      // text
      textPrimary: SdColors.black,
      textSecondary: SdColors.grey900,

      // input
      inputBg: SdColors.white,
      inputBorder: SdColors.grey,
      inputCursor: SdColors.black,

      // icon
      iconPrimary: const Color(0xFF434750),
      iconSecondary: SdColors.white,
      iconBg: AppColors.primary50,
      inputColor: SdColors.black,
      inputHint: SdColors.grey700,
      inputActiveBorder: AppColors.primary,

      // card
      cardBgHighlight: AppColors.primary400,
      bgCard: SdColors.grey50,

      // shadow
      appbarShadow: SdColors.black54,
      containerShadow: SdColors.black12,
    );
  }

  // dark
  static AppTheme dark() {
    return AppTheme(
      primary: AppColors.primary600,

      // bg
      bgPrimary: AppColors.primaryDark,
      bgSecondary: AppColors.secondaryDark,

      // text
      textPrimary: SdColors.white,
      textSecondary: SdColors.grey800,

      //input
      inputBg: SdColors.white,
      inputBorder: SdColors.white,
      inputCursor: SdColors.white,
      inputColor: SdColors.black,
      inputHint: SdColors.grey900,
      inputActiveBorder: AppColors.primary900,

      // icon
      iconPrimary: Colors.white,
      iconSecondary: SdColors.black,
      iconBg: AppColors.primary300,

      // card
      cardBgHighlight: AppColors.primary600,
      bgCard: const Color(0xFF1C1C1E),

      // shadow
      appbarShadow: SdColors.grey50,
      containerShadow: SdColors.grey5,
    );
  }

  @override
  ThemeExtension<AppTheme> copyWith() {
    return this;
  }

  @override
  ThemeExtension<AppTheme> lerp(
    covariant ThemeExtension<AppTheme>? other,
    double t,
  ) {
    return this;
  }
}
