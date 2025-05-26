import 'package:fin_calc/src/core/core.dart';
import 'package:flutter/material.dart';

class SettingModel {
  final String title;
  final List<SettingItem> items;

  SettingModel({required this.title, required this.items});
}

class SettingItem {
  final String title;
  final String subTitle;
  final IconData icon;
  final void Function() onPress;
  final SettingTypeEnum type;

  SettingItem({
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.onPress,
    this.type = SettingTypeEnum.basic,
  });
}
