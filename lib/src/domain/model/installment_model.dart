import 'package:equatable/equatable.dart';
import 'package:fin_calc/src/core/core.dart';

class InstallmentModel extends Equatable {
  final double loanAmount;
  final double rate;
  final int time;
  final TimeUnitEnum timeUnit;

  const InstallmentModel({
    required this.loanAmount,
    required this.rate,
    required this.time,
    required this.timeUnit,
  });

  factory InstallmentModel.init() {
    return const InstallmentModel(
      loanAmount: 0,
      rate: 1,
      time: 1,
      timeUnit: TimeUnitEnum.month,
    );
  }

  @override
  List<Object?> get props => [loanAmount, rate, time, timeUnit];
}
