import 'package:fin_calc/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:system_design_flutter/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _navToFeature(LoanFeatureEnum feature) {
    switch (feature) {
      case LoanFeatureEnum.compoundInterest:
        NavigationManager.router.push(AppRouter.COMPOUND_INTEREST.fullPath);
        break;
      case LoanFeatureEnum.installment:
        NavigationManager.router.push(AppRouter.INSTALLMENT.fullPath);
        break;
      case LoanFeatureEnum.simpleInterest:
        NavigationManager.router.push(AppRouter.SIMPLE_INTEREST.fullPath);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        titleWidget: GradientText(
          'FINANCE CALCULATOR',
          style: SdTextStyle.heading14(),
          colors: [context.appTheme.primary, Colors.red, Colors.teal],
        ),
        showBackButton: false,
        actions: const [_OpenSettingButton()],
        centerTitle: false,
      ),
      backgroundColor: context.appTheme.bgPrimary,
      body: Container(
        padding: EdgeInsets.only(
          left: SdSpacing.s16,
          right: SdSpacing.s16,
          top: SdSpacing.s32,
          bottom: SdSpacing.s16,
        ),
        child: ListView.separated(
          clipBehavior: Clip.none,
          separatorBuilder:
              (context, index) => const SdVerticalSpacing(xRatio: 1.5),
          itemCount: LoanFeatureEnum.values.length,
          itemBuilder: (context, index) {
            final feature = LoanFeatureEnum.values[index];

            return OptionRow(
              title: feature.title,
              description: feature.description,
              iconData: feature.iconData,
              onTap: () => _navToFeature(feature),
            );
          },
        ),
      ),
    );
  }
}

class _OpenSettingButton extends StatelessWidget {
  const _OpenSettingButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed:
          () => NavigationManager.router.push(AppRouter.SETTING_ROOT.fullPath),
      icon: SdIcon(
        iconData: Icons.settings,
        iconSize: SdSpacing.s24,
        color: context.appTheme.iconPrimary,
      ),
    );
  }
}
