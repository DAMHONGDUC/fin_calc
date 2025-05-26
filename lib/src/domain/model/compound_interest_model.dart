import 'package:equatable/equatable.dart';
import 'package:fin_calc/src/core/core.dart';

class CompoundInterestModel extends Equatable {
  final double principalAmount;
  final double monthlyContribution;
  final double rate;
  final int time;
  final CompoundFrequencyEnum frequency;
  final TimeUnitEnum timeUnit;

  const CompoundInterestModel({
    required this.principalAmount,
    required this.monthlyContribution,
    required this.rate,
    required this.time,
    required this.frequency,
    required this.timeUnit,
  });

  factory CompoundInterestModel.init({
    double principalAmount = 0.0,
    double monthlyContribution = 0.0,
    double rate = 1,
    int time = 1,
    CompoundFrequencyEnum frequency = CompoundFrequencyEnum.annually,
    TimeUnitEnum timeUnit = TimeUnitEnum.year,
  }) {
    return CompoundInterestModel(
      principalAmount: principalAmount,
      monthlyContribution: monthlyContribution,
      rate: rate,
      time: time,
      frequency: frequency,
      timeUnit: timeUnit,
    );
  }

  @override
  List<Object?> get props => [
    principalAmount,
    monthlyContribution,
    rate,
    time,
    frequency,
    timeUnit,
  ];

  @override
  String toString() {
    return 'CompoundInterestModel('
        'principalAmount: ${principalAmount.toStringAsFixed(2)}, '
        'monthlyContribution: ${monthlyContribution.toStringAsFixed(2)}, '
        'rate: ${rate.toStringAsFixed(2)}%, '
        'time (years): ${timeUnit.toYears(time)}, '
        'frequency: ${frequency.value})';
  }
}
