import 'package:fin_calc/src/core/core.dart';
import 'package:fin_calc/src/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class FinanceResultCard extends StatelessWidget {
  final String note;
  final List<FinanceResultItemModel> items;

  const FinanceResultCard({
    super.key,
    required this.items,
    this.note = 'Results update in real time',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(SdSpacing.s16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.appTheme.cardBgHighlight,
            borderRadius: BorderRadius.circular(SdSpacing.s12),
            boxShadow: [
              SdDecorationHelper.boxShadow(
                ratio: 2,
                color: context.appTheme.containerShadow,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < items.length; i++) ...[
                InfoRow(
                  label: items[i].label,
                  content: SdFormatHelper.formatMoneyFromDouble(
                    items[i].content,
                  ),
                ),
                if (i != items.length - 1) const SdVerticalSpacing(),
              ],
            ],
          ),
        ),
        const SdVerticalSpacing(xRatio: 0.4),
        if (note.isNotNullAndNotEmpty)
          Text(
            '*$note',
            style: SdTextStyle.body10().withColor(SdColors.red500),
          ),
      ],
    );
  }
}
