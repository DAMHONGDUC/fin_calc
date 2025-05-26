import 'package:fin_calc/src/core/core.dart';
import 'package:fin_calc/src/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class SettingSectionView extends StatelessWidget {
  const SettingSectionView({
    super.key,
    required this.section,
    required this.itemBuilder,
  });
  final SettingModel section;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          section.title,
          style: SdTextStyle.heading10().copyWith(
            color: context.appTheme.textPrimary,
          ),
        ),
        const SdVerticalSpacing(xRatio: 0.5),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: section.items.length,
          separatorBuilder: (_, __) => const SdVerticalSpacing(),
          itemBuilder:
              itemBuilder ??
              (context, index) {
                final item = section.items[index];

                return SettingItemView(
                  title: item.title,
                  subTitle: item.subTitle,
                  onPress: item.onPress,
                  icon: item.icon,
                );
              },
        ),
      ],
    );
  }
}
