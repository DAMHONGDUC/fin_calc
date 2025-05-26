import 'package:fin_calc/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:system_design_flutter/index.dart';

class AppNumberTextField extends StatelessWidget {
  const AppNumberTextField({
    super.key,
    required this.controller,
    required this.title,
    this.focusNode,
    this.rightWidget,
    this.inputFormatters,
    this.allowClear = false,
    this.onChanged,
    this.hintText,
    this.limitValue,
    this.onlyInt = false,
  });

  final TextEditingController controller;
  final String title;
  final FocusNode? focusNode;
  final Widget? rightWidget;
  final List<TextInputFormatter>? inputFormatters;
  final bool allowClear;
  final Function(String)? onChanged;
  final String? hintText;
  final int? limitValue;
  final bool onlyInt;

  @override
  Widget build(BuildContext context) {
    return SdNumberTextField(
      controller: controller,
      title: title,
      focusNode: focusNode,
      rightWidget: rightWidget,
      inputFormatters: inputFormatters,
      allowClear: allowClear,
      onChanged: onChanged,
      hintText: hintText,
      limitValue: limitValue,
      onlyInt: onlyInt,
      textColor: context.appTheme.textPrimary,
      inputHintColor: context.appTheme.inputHint,
      activeBorderColor: context.appTheme.inputActiveBorder,
    );
  }
}
