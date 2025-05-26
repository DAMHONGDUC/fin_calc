import 'package:fin_calc/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? title;
  final String? hint;
  final VoidCallback? onTap;
  final Widget? rightWidget;
  final bool readOnly;
  final TextStyle? textStyle;

  const AppTextField({
    required this.controller,
    this.title,
    this.hint,
    this.onTap,
    this.rightWidget,
    this.readOnly = false,
    this.textStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SdTextField(
      controller: controller,
      title: title,
      hint: hint,
      onTap: onTap,
      rightWidget: rightWidget,
      readOnly: readOnly,
      textStyle: textStyle,
      textColor: context.appTheme.textPrimary,
      activeBorderColor: context.appTheme.inputActiveBorder,
    );
  }
}
