import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:fin_calc/src/core/core.dart';
import 'package:fin_calc/src/domain/model/setting_model.dart';
import 'package:fin_calc/src/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

final LIST_SETTING = [
  SettingModel(
    title: 'Device',
    items: [
      SettingItem(
        icon: Icons.dark_mode,
        onPress: () {},
        title: 'Theme mode',
        subTitle: '',
        type: SettingTypeEnum.themeMode,
      ),
    ],
  ),
];

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.bgPrimary,
      appBar: const MainAppBar(title: 'Settings', centerTitle: true),
      body: ListView.separated(
        padding: EdgeInsets.all(SdSpacingConstants.spacing16),
        itemCount: LIST_SETTING.length,
        separatorBuilder: (_, __) => const SdVerticalSpacing(xRatio: 2),
        itemBuilder: (context, index) {
          final section = LIST_SETTING[index];

          return SettingSectionView(
            section: section,
            itemBuilder: (context, i) {
              final item = section.items[i];

              if (item.type == SettingTypeEnum.themeMode) {
                return _buildSwitchThemeSetting(context: context, item: item);
              }

              return SettingItemView(
                title: item.title,
                subTitle: item.subTitle,
                onPress: item.onPress,
                icon: item.icon,
              );
            },
          );
        },
      ),
    );
  }

  String _getThemeMode(AdaptiveThemeMode themeMode) {
    switch (themeMode) {
      case AdaptiveThemeMode.dark:
        return 'Dark';
      case AdaptiveThemeMode.light:
        return 'Light';
      case AdaptiveThemeMode.system:
        return 'System';
    }
  }

  Widget _buildSwitchThemeSetting({
    required BuildContext context,
    required SettingItem item,
  }) {
    return SettingItemView(
      icon: Icons.contrast_sharp,
      onPress: () {
        SdHelper.showSelectBottomSheet<AdaptiveThemeMode>(
          context: context,
          bgColor: context.appTheme.bgPrimary,
          textColor: context.appTheme.textPrimary,
          data: AdaptiveThemeMode.values,
          itemLabelBuilder: _getThemeMode,
          onSelected: (selected) {
            Helper.changeAndroidNavigationBarColorWhenSwitchTheme(
              isDark: selected == Brightness.dark,
            );
            AdaptiveTheme.of(context).setThemeMode(selected);
          },
        );
      },
      title: item.title,
      subTitle: _getThemeMode(AdaptiveTheme.of(context).mode),
    );
  }
}
