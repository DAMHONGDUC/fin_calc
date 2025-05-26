import 'package:flutter/material.dart';

class BoundaryContainer extends StatelessWidget {
  final Color borderColor;
  final double borderWidth;
  final double cornerRadius;
  final EdgeInsets? padding;
  final Widget child;
  final void Function()? onTap;

  const BoundaryContainer({
    super.key,
    this.borderColor = Colors.grey,
    this.borderWidth = 1,
    this.cornerRadius = 8.0,
    this.padding,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: borderWidth),
          borderRadius: BorderRadius.circular(cornerRadius),
        ),
        padding: padding ?? const EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}
