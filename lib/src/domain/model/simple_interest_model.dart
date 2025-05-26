import 'package:fin_calc/src/core/core.dart';

class SimpleInterestModel {
  final double principalAmount;
  final double rate;
  final int time;
  final TimeUnitEnum timeUnit;

  const SimpleInterestModel({
    required this.principalAmount,
    required this.rate,
    required this.time,
    required this.timeUnit,
  });

  factory SimpleInterestModel.init({
    double principalAmount = 0.0,
    double rate = 1,
    int time = 1,
    TimeUnitEnum timeUnit = TimeUnitEnum.year,
  }) {
    return SimpleInterestModel(
      principalAmount: principalAmount,
      rate: rate,
      time: time,
      timeUnit: timeUnit,
    );
  }
}
