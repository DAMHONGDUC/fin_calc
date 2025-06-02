import 'package:fin_calc/src/core/core.dart';
import 'package:fin_calc/src/domain/domain.dart';
import 'package:fin_calc/src/presentation/simple_interest/simple_interest_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_design_flutter/index.dart';

final defaultSimpleInterest = SimpleInterestModel.init();

class SimpleInterestScreen extends StatelessWidget {
  const SimpleInterestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SimpleInterestController(),
      child: const _SimpleInterestView(),
    );
  }
}

class _SimpleInterestView extends StatefulWidget {
  const _SimpleInterestView();

  @override
  State<_SimpleInterestView> createState() => _SimpleInterestViewState();
}

class _SimpleInterestViewState extends State<_SimpleInterestView> {
  late TextEditingController _principalTC;
  late TextEditingController _rateTC;
  late TextEditingController _timeTC;
  late TextEditingController _timeUnitTC;
  late TimeUnitEnum _timeUnit;

  @override
  void initState() {
    super.initState();
    _principalTC = TextEditingController();
    _rateTC = TextEditingController();
    _timeTC = TextEditingController();
    _timeUnitTC = TextEditingController(
      text: defaultSimpleInterest.timeUnit.title,
    );
    _timeUnit = defaultSimpleInterest.timeUnit;

    // Add listeners for each controller
    _principalTC.addListener(_handleInputChange);
    _rateTC.addListener(_handleInputChange);
    _timeTC.addListener(_handleInputChange);
    _timeUnitTC.addListener(_handleInputChange);

    // trigger first calculation
    _handleInputChange();
  }

  void _handleInputChange() {
    context.read<SimpleInterestController>().add(
      CalculateSimpleInterestEvent(
        SimpleInterestModel(
          principalAmount:
              double.tryParse(
                SdFormatHelper.getCleanAmountFromString(_principalTC.text),
              ) ??
              defaultSimpleInterest.principalAmount,
          rate: double.tryParse(_rateTC.text) ?? defaultSimpleInterest.rate,
          time: int.tryParse(_timeTC.text) ?? defaultSimpleInterest.time,
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
    _timeUnitTC.dispose();

    super.dispose();
  }

  void _handleChangeTimeUnit() {
    SdHelper.showSelectBottomSheet<TimeUnitEnum>(
      context: context,
      title: 'Select Time Unit',
      bgColor: context.appTheme.bgPrimary,
      textColor: context.appTheme.textPrimary,
      data: TimeUnitEnum.values,
      itemLabelBuilder: (timeType) => timeType.title,
      onSelected: (selected) {
        _timeUnitTC.text = selected.title;
        _timeUnit = selected;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'Simple Interest Calculator',
        onShare: () {
          context.read<SimpleInterestController>().add(
            const SimpleInterestShareResultEvent(),
          );
        },
      ),
      backgroundColor: context.appTheme.bgPrimary,
      body: Padding(
        padding: EdgeInsets.all(SdSpacing.s16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SdVerticalSpacing(),
              const _ResultArea(),
              const SdVerticalSpacing(xRatio: 2),
              _InputArea(
                handleChangeTimeUnit: _handleChangeTimeUnit,
                principalTC: _principalTC,
                rateTC: _rateTC,
                timeTC: _timeTC,
                timeUnitTC: _timeUnitTC,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ResultArea extends StatelessWidget {
  const _ResultArea();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimpleInterestController, SimpleInterestState>(
      buildWhen: (previous, current) {
        return current is SimpleInterestCalculatedState;
      },
      builder: (context, state) {
        return FinanceResultCard(
          items: [
            FinanceResultItemModel(
              label: 'Principa Amount',
              content: state.data.simpleInterest.principalAmount,
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
  final TextEditingController timeUnitTC;
  final VoidCallback handleChangeTimeUnit;

  const _InputArea({
    required this.principalTC,
    required this.rateTC,
    required this.timeTC,
    required this.timeUnitTC,
    required this.handleChangeTimeUnit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppNumberTextField(
          allowClear: true,
          title: 'Principal Amount',
          hintText: defaultSimpleInterest.principalAmount.toInt().toString(),
          controller: principalTC,
          inputFormatters: [SdFormatHelper.amountFormatter()],
        ),
        const SdVerticalSpacing(),
        AppNumberTextField(
          title: 'Time',
          onlyInt: true,
          limitValue: SdConstants.limitTime,
          hintText: defaultSimpleInterest.time.toString(),
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
          hintText: defaultSimpleInterest.rate.toInt().toString(),
          controller: rateTC,
          inputFormatters: [SdFormatHelper.amountFormatter()],
        ),
        const SdVerticalSpacing(),
      ],
    );
  }
}
