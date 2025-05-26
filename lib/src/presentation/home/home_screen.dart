import 'package:fin_calc/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _navToFeature(LoanFeatureEnum feature) {
    switch (feature) {
      case LoanFeatureEnum.compoundInterest:
        NavigationManager.router.push(AppRouter.COMPOUND_INTEREST.fullPaths);
        break;
      case LoanFeatureEnum.installment:
        NavigationManager.router.push(AppRouter.INSTALLMENT.fullPaths);
        break;
      case LoanFeatureEnum.simpleInterest:
        NavigationManager.router.push(AppRouter.SIMPLE_INTEREST.fullPaths);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        title: 'Finance Calculator',
        showBackButton: false,
        actions: [_OpenSettingButton()],
        centerTitle: false,
      ),
      backgroundColor: context.appTheme.bgPrimary,
      body: Container(
        padding: EdgeInsets.only(
          left: SdSpacingConstants.spacing16,
          right: SdSpacingConstants.spacing16,
          top: SdSpacingConstants.spacing32,
          bottom: SdSpacingConstants.spacing16,
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
          () => NavigationManager.router.push(AppRouter.SETTING_ROOT.fullPaths),
      icon: SdIcon(
        iconData: Icons.settings,
        iconSize: SdIconSize.size24,
        color: context.appTheme.iconPrimary,
      ),
    );
  }
}
