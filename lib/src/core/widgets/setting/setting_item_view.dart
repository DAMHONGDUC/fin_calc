import 'package:fin_calc/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class SettingItemView extends StatelessWidget {
  const SettingItemView({
    super.key,
    required this.title,
    required this.onPress,
    required this.icon,
    required this.subTitle,
  });

  final String title;
  final void Function() onPress;
  final IconData icon;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final borderRadius = SdSpacing.s12;

    return Container(
      decoration: BoxDecoration(
        color: context.appTheme.bgCard,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: Column(
        children: [
          SdInkWell(
            borderRadius: borderRadius,
            onTap: onPress,
            padding: EdgeInsets.all(SdSpacing.s14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SdIcon(iconData: icon, color: context.appTheme.iconPrimary),
                    const SdHorizontalSpacing(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: SdTextStyle.body12().copyWith(
                            color: context.appTheme.textPrimary,
                          ),
                        ),
                        const SdVerticalSpacing(xRatio: 0.2),
                        Text(
                          subTitle,
                          style: SdTextStyle.body10().withColor(
                            context.appTheme.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SdIcon(
                  iconData: Icons.chevron_right,
                  color: context.appTheme.iconPrimary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
