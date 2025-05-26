import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fin_calc/src/core/core.dart';
import 'package:fin_calc/src/domain/domain.dart';
import 'package:fin_calc/src/presentation/installment/installment_controller.dart';
import 'package:system_design_flutter/index.dart';

final defaultInstallment = InstallmentModel.init();

class InstallmentScreen extends StatelessWidget {
  const InstallmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InstallmentController(),
      child: const _InstallmentView(),
    );
  }
}

class _InstallmentView extends StatefulWidget {
  const _InstallmentView();

  @override
  State<_InstallmentView> createState() => _InstallmentViewState();
}

class _InstallmentViewState extends State<_InstallmentView> {
  late TextEditingController _amountTC;
  late TextEditingController _rateTC;
  late TextEditingController _timeTC;
  late TextEditingController _timeUnitTC;
  late TimeUnitEnum _timeUnit;

  @override
  void initState() {
    super.initState();
    _amountTC = TextEditingController();
    _rateTC = TextEditingController();
    _timeTC = TextEditingController();
    _timeUnitTC = TextEditingController(
      text: defaultInstallment.timeUnit.title,
    );
    _timeUnit = defaultInstallment.timeUnit;

    _amountTC.addListener(_handleInputChange);
    _rateTC.addListener(_handleInputChange);
    _timeTC.addListener(_handleInputChange);
    _timeUnitTC.addListener(_handleInputChange);

    _handleInputChange();
  }

  void _handleInputChange() {
    context.read<InstallmentController>().add(
      CalculateInstallmentEvent(
        InstallmentModel(
          loanAmount:
              double.tryParse(
                SdFormatHelper.getCleanAmountFromString(_amountTC.text),
              ) ??
              defaultInstallment.loanAmount,
          rate: double.tryParse(_rateTC.text) ?? defaultInstallment.rate,
          time: int.tryParse(_timeTC.text) ?? defaultInstallment.time,
          timeUnit: _timeUnit,
        ),
      ),
    );
  }

  void _handleChangeTenureUnit() {
    SdHelper.showSelectBottomSheet<TimeUnitEnum>(
      context: context,
      title: 'Select Time Unit',
      bgColor: context.appTheme.bgPrimary,
      textColor: context.appTheme.textPrimary,
      data: TimeUnitEnum.values.where((e) => e != TimeUnitEnum.day).toList(),
      itemLabelBuilder: (unit) => unit.title,
      onSelected: (selected) {
        _timeUnitTC.text = selected.title;
        _timeUnit = selected;
      },
    );
  }

  @override
  void dispose() {
    _amountTC.dispose();
    _rateTC.dispose();
    _timeTC.dispose();
    _timeUnitTC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'Installment Calculator',
        onShare: () {
          context.read<InstallmentController>().add(
            const InstallmentShareResultEvent(),
          );
        },
      ),
      backgroundColor: context.appTheme.bgPrimary,
      body: Padding(
        padding: EdgeInsets.all(SdSpacingConstants.spacing16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SdVerticalSpacing(),
              const _ResultArea(),
              const SdVerticalSpacing(xRatio: 2),
              _InstallmentInputArea(
                amountTC: _amountTC,
                rateTC: _rateTC,
                tenureTC: _timeTC,
                tenureUnitTC: _timeUnitTC,
                handleChangeTenureUnit: _handleChangeTenureUnit,
              ),
              const SdVerticalSpacing(),
              Text(
                '*Detail Information:',
                style: SdTextStyle.body10().withColor(SdColors.red500),
              ),
              _InstallmentTable(),
              const SdVerticalSpacing(),
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
    return BlocBuilder<InstallmentController, InstallmentState>(
      buildWhen: (previous, current) => current is InstallmentCalculatedState,
      builder: (context, state) {
        return FinanceResultCard(
          note: 'Interest calculated on the reducing balance',
          items: [
            FinanceResultItemModel(
              label: 'Loan Amount',
              content: state.data.installmentModel.loanAmount,
            ),
            FinanceResultItemModel(
              label: 'Loan Interest',
              content:
                  state.data.totalAmount -
                  state.data.installmentModel.loanAmount,
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

class _InstallmentTable extends StatelessWidget {
  Widget _buildTitleWidget(BuildContext context, String title) {
    return Text(
      title,
      style:
          SdTextStyle.body10()
              .withColor(context.appTheme.textPrimary)
              .wMedium(),
    );
  }

  Widget _buildContentWidget(BuildContext context, double value) {
    return Text(
      SdFormatHelper.formatMoneyFromDouble(value),
      style: SdTextStyle.body10().withColor(context.appTheme.textPrimary),
    );
  }

  @override
  Widget build(BuildContext context) {
    final monthDeco = BoxConstraints(
      minWidth: SdSpacingConstants.spacing6,
      maxWidth: SdSpacingConstants.spacing20,
    );

    return BlocBuilder<InstallmentController, InstallmentState>(
      buildWhen: (previous, current) => current is InstallmentCalculatedState,
      builder: (context, state) {
        final installments = state.data.installmentTable;

        // Build all data rows
        final rows =
            installments.map((e) {
              return DataRow(
                cells: [
                  DataCell(
                    ConstrainedBox(
                      constraints: monthDeco,
                      child: Text(
                        e.month.toString(),
                        style: SdTextStyle.body10().withColor(
                          context.appTheme.textPrimary,
                        ),
                      ),
                    ),
                  ),
                  DataCell(_buildContentWidget(context, e.totalPayment)),
                  DataCell(_buildContentWidget(context, e.principal)),
                  DataCell(_buildContentWidget(context, e.interest)),
                  DataCell(_buildContentWidget(context, e.remainingBalance)),
                ],
              );
            }).toList();

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columnSpacing: SdSpacingConstants.spacing16,
            horizontalMargin: SdSpacingConstants.spacing8,
            columns: [
              DataColumn(
                label: ConstrainedBox(
                  constraints: monthDeco,
                  child: _buildTitleWidget(context, 'Mth'),
                ),
              ),
              DataColumn(label: _buildTitleWidget(context, 'Total Payment')),
              DataColumn(label: _buildTitleWidget(context, 'Principal')),
              DataColumn(label: _buildTitleWidget(context, 'Interest')),
              DataColumn(label: _buildTitleWidget(context, 'Remaning')),
            ],
            rows: rows,
          ),
        );
      },
    );
  }
}

class _InstallmentInputArea extends StatelessWidget {
  final TextEditingController amountTC;
  final TextEditingController rateTC;
  final TextEditingController tenureTC;
  final TextEditingController tenureUnitTC;
  final VoidCallback handleChangeTenureUnit;

  const _InstallmentInputArea({
    required this.amountTC,
    required this.rateTC,
    required this.tenureTC,
    required this.tenureUnitTC,
    required this.handleChangeTenureUnit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppNumberTextField(
          allowClear: true,
          title: 'Loan Amount',
          hintText: defaultInstallment.loanAmount.toInt().toString(),
          controller: amountTC,
          inputFormatters: [SdFormatHelper.amountFormatter()],
        ),
        const SdVerticalSpacing(),
        AppNumberTextField(
          title: 'Time',
          onlyInt: true,
          limitValue: SdConstants.limitTime,
          hintText: defaultInstallment.time.toString(),
          controller: tenureTC,
          rightWidget: SdTextField(
            textStyle: SdTextStyle.body12(),
            controller: tenureUnitTC,
            readOnly: true,
            rightWidget: SdIcon(
              iconData: Icons.arrow_drop_down,
              color: context.appTheme.inputHint,
            ),
            onTap: handleChangeTenureUnit,
          ),
        ),
        const SdVerticalSpacing(),
        AppNumberTextField(
          title: 'Yearly Rate (%)',
          hintText: defaultInstallment.rate.toInt().toString(),
          controller: rateTC,
          inputFormatters: [SdFormatHelper.amountFormatter()],
        ),
        const SdVerticalSpacing(),
      ],
    );
  }
}
