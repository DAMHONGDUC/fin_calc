import 'package:fin_calc/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class OptionRow extends StatelessWidget {
  const OptionRow({
    super.key,
    required this.title,
    required this.onTap,
    required this.iconData,
    required this.description,
  });
  final String title;
  final void Function()? onTap;
  final IconData iconData;
  final String description;

  @override
  Widget build(BuildContext context) {
    final radius = SdSpacingConstants.spacing20;

    return Container(
      decoration: BoxDecoration(
        color: context.appTheme.bgSecondary,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        boxShadow: [
          SdDecorationHelper.boxShadow(
            ratio: 2,
            color: context.appTheme.containerShadow,
          ),
        ],
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(SdSpacingConstants.spacing16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: context.appTheme.cardBgHighlight,
                      borderRadius: BorderRadius.all(
                        Radius.circular(SdSpacingConstants.spacing14),
                      ),
                    ),
                    padding: EdgeInsets.all(SdSpacingConstants.spacing10),
                    child: SdIcon(
                      iconData: iconData,
                      color: SdColors.white,
                      iconSize: SdIconSize.size24,
                    ),
                  ),
                  const SdHorizontalSpacing(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style:
                            SdTextStyle.body12()
                                .withColor(context.appTheme.textPrimary)
                                .wMedium(),
                      ),
                      const SdVerticalSpacing(xRatio: 0.5),
                      Text(
                        description,
                        style: SdTextStyle.body10().withColor(
                          context.appTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SdIcon(
                iconData: Icons.arrow_forward_ios,
                iconSize: SdIconSize.size16,
                color: context.appTheme.iconPrimary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
