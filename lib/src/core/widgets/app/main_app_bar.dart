import 'package:fin_calc/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    this.actions,
    this.title,
    this.showBackButton = true,
    this.onShare,
    this.centerTitle = true,
    this.titleWidget,
  });

  final List<Widget>? actions;
  final String? title;
  final bool showBackButton;
  final void Function()? onShare;
  final bool centerTitle;
  final Widget? titleWidget;

  @override
  Widget build(BuildContext context) {
    return SdAppBar(
      title: title,
      titleWidget: titleWidget,
      centerTitle: centerTitle,
      showBackButton: showBackButton,
      actions: [
        ...(actions ?? []),
        if (onShare != null)
          IconButton(
            onPressed: onShare,
            icon: SdIcon(
              iconData: Icons.share,
              color: context.appTheme.iconPrimary,
            ),
          ),
      ],
      textColor: context.appTheme.textPrimary,
      backgroundColor: context.appTheme.bgPrimary,
      shadowColor: context.appTheme.appbarShadow,
      backButtonContainerBg: context.appTheme.iconBg,
      backButtonIconColor: context.appTheme.iconPrimary,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
