import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String content;

  const InfoRow({super.key, required this.label, required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text('$label:', style: SdTextStyle.body10().whiteText()),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.53,
          child: Text(
            content,
            style: SdTextStyle.body14().whiteText(),
            textAlign: TextAlign.right,
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    );
  }
}
