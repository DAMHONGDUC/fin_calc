import 'package:fin_calc/src/core/core.dart';
import 'package:fin_calc/src/domain/domain.dart';
import 'package:fin_calc/src/presentation/compound_interest/compound_interest_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_design_flutter/index.dart';

final defaultCompoundInterest = CompoundInterestModel.init();

class CompoundInterestScreen extends StatelessWidget {
  const CompoundInterestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CompoundInterestController(),
      child: const _CompoundInterestView(),
    );
  }
}

class _CompoundInterestView extends StatefulWidget {
  const _CompoundInterestView();

  @override
  State<_CompoundInterestView> createState() => _CompoundInterestViewState();
}

class _CompoundInterestViewState extends State<_CompoundInterestView> {
  late TextEditingController _principalTC;
  late TextEditingController _rateTC;
  late TextEditingController _timeTC;
  late TextEditingController _frequencyTC;
  late TextEditingController _timeUnitTC;
  late TextEditingController _monthlyContributionTC;
  late TimeUnitEnum _timeUnit;
  late CompoundFrequencyEnum _compoundFrequency;

  @override
  void initState() {
    super.initState();
    _principalTC = TextEditingController();
    _rateTC = TextEditingController();
    _timeTC = TextEditingController();
    _frequencyTC = TextEditingController(
      text: defaultCompoundInterest.frequency.title,
    );
    _timeUnitTC = TextEditingController(
      text: defaultCompoundInterest.timeUnit.title,
    );
    _monthlyContributionTC = TextEditingController();
    _timeUnit = defaultCompoundInterest.timeUnit;
    _compoundFrequency = defaultCompoundInterest.frequency;

    // Add listeners for each controller
    _principalTC.addListener(_handleInputChange);
    _rateTC.addListener(_handleInputChange);
    _timeTC.addListener(_handleInputChange);
    _frequencyTC.addListener(_handleInputChange);
    _timeUnitTC.addListener(_handleInputChange);
    _monthlyContributionTC.addListener(_handleInputChange);

    // call calculateInterest when the screen is first loaded
    _handleInputChange();
  }

  void _handleInputChange() {
    context.read<CompoundInterestController>().add(
      CalculateCompoundInterestEvent(
        CompoundInterestModel(
          principalAmount:
              double.tryParse(
                SdFormatHelper.getCleanAmountFromString(_principalTC.text),
              ) ??
              defaultCompoundInterest.principalAmount,
          monthlyContribution:
              double.tryParse(
                SdFormatHelper.getCleanAmountFromString(
                  _monthlyContributionTC.text,
                ),
              ) ??
              defaultCompoundInterest.monthlyContribution,
          rate: double.tryParse(_rateTC.text) ?? defaultCompoundInterest.rate,
          time: int.tryParse(_timeTC.text) ?? defaultCompoundInterest.time,
          frequency: _compoundFrequency,
          timeUnit: _timeUnit,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _principalTC.dispose();
    _rateTC.dispose();
    _timeTC.dispose();
    _frequencyTC.dispose();
    _timeUnitTC.dispose();
    _monthlyContributionTC.dispose();

    super.dispose();
  }

  void _handleChangeTimeUnit() {
    SdHelper.showSelectBottomSheet<TimeUnitEnum>(
      context: context,
      bgColor: context.appTheme.bgPrimary,
      textColor: context.appTheme.textPrimary,
      title: 'Select Time Unit',
      data: TimeUnitEnum.values,
      itemLabelBuilder: (timeType) => timeType.title,
      onSelected: (selected) {
        _timeUnitTC.text = selected.title;
        _timeUnit = selected;
      },
    );
  }

  void _handleChangeFrequency() {
    SdHelper.showSelectBottomSheet<CompoundFrequencyEnum>(
      context: context,
      bgColor: context.appTheme.bgPrimary,
      textColor: context.appTheme.textPrimary,
      title: 'Choose Frequency',
      data: CompoundFrequencyEnum.values,
      itemLabelBuilder: (e) => e.title,
      onSelected: (selected) {
        _frequencyTC.text = selected.title;
        _compoundFrequency = selected;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'Compound Interest Calculator',
        onShare: () {
          context.read<CompoundInterestController>().add(
            const CompoundInterestShareResultEvent(),
          );
        },
      ),
      backgroundColor: context.appTheme.bgPrimary,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(SdSpacingConstants.spacing16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SdVerticalSpacing(),
                _ResultArea(),
                const SdVerticalSpacing(xRatio: 2),
                _InputArea(
                  principalTC: _principalTC,
                  rateTC: _rateTC,
                  timeTC: _timeTC,
                  frequencyTC: _frequencyTC,
                  timeUnitTC: _timeUnitTC,
                  monthlyContributionTC: _monthlyContributionTC,
                  handleChangeTimeUnit: _handleChangeTimeUnit,
                  handleChangeFrequency: _handleChangeFrequency,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ResultArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompoundInterestController, CompoundInterestState>(
      buildWhen: (previous, current) {
        return current is CompoundInterestCalculatedState;
      },
      builder: (context, state) {
        return FinanceResultCard(
          items: [
            FinanceResultItemModel(
              label: 'Principa Amount',
              content: state.data.compoundInterest.principalAmount,
            ),
            FinanceResultItemModel(
              label: 'Total Amount',
              content: state.data.totalAmount,
            ),
          ],
        );
      },
    );
  }
}

class _InputArea extends StatelessWidget {
  final TextEditingController principalTC;
  final TextEditingController rateTC;
  final TextEditingController timeTC;
  final TextEditingController frequencyTC;
  final TextEditingController timeUnitTC;
  final TextEditingController monthlyContributionTC;
  final VoidCallback handleChangeTimeUnit;
  final VoidCallback handleChangeFrequency;

  const _InputArea({
    required this.principalTC,
    required this.rateTC,
    required this.timeTC,
    required this.frequencyTC,
    required this.timeUnitTC,
    required this.monthlyContributionTC,
    required this.handleChangeTimeUnit,
    required this.handleChangeFrequency,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppNumberTextField(
          allowClear: true,
          hintText: defaultCompoundInterest.principalAmount.toInt().toString(),
          title: 'Principal Amount',
          controller: principalTC,
          inputFormatters: [SdFormatHelper.amountFormatter()],
        ),
        const SdVerticalSpacing(),
        AppNumberTextField(
          allowClear: true,
          hintText:
              defaultCompoundInterest.monthlyContribution.toInt().toString(),
          title: 'Monthly Contribution',
          controller: monthlyContributionTC,
          inputFormatters: [SdFormatHelper.amountFormatter()],
        ),
        const SdVerticalSpacing(),
        AppNumberTextField(
          title: 'Time',
          onlyInt: true,
          limitValue: SdConstants.limitTime,
          hintText: defaultCompoundInterest.time.toString(),
          controller: timeTC,
          rightWidget: SdTextField(
            textStyle: SdTextStyle.body12(),
            controller: timeUnitTC,
            readOnly: true,
            rightWidget: SdIcon(
              iconData: Icons.arrow_drop_down,
              color: context.appTheme.inputHint,
            ),
            onTap: handleChangeTimeUnit,
          ),
        ),
        const SdVerticalSpacing(),
        AppNumberTextField(
          title: 'Yearly Rate (%)',
          hintText: defaultCompoundInterest.rate.toInt().toString(),
          controller: rateTC,
          inputFormatters: [SdFormatHelper.amountFormatter()],
        ),
        const SdVerticalSpacing(),
        AppTextField(
          title: 'Compounding Frequency (per year)',
          textStyle: SdTextStyle.body12(),
          controller: frequencyTC,
          readOnly: true,
          rightWidget: SdIcon(
            iconData: Icons.arrow_drop_down,
            color: context.appTheme.inputHint,
          ),
          onTap: handleChangeFrequency,
        ),
        const SdVerticalSpacing(),
      ],
    );
  }
}
