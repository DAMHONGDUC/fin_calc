enum TimeUnitEnum { year, month, day }

extension TimeUnitEnumExtension on TimeUnitEnum {
  String get title {
    switch (this) {
      case TimeUnitEnum.month:
        return 'Month';
      case TimeUnitEnum.year:
        return 'Year';
      case TimeUnitEnum.day:
        return 'Day';
    }
  }

  double toYears(int time) {
    switch (this) {
      case TimeUnitEnum.year:
        return time.toDouble();
      case TimeUnitEnum.month:
        return (time / 12);
      case TimeUnitEnum.day:
        return (time / 365);
    }
  }

  double toMonths(int time) {
    switch (this) {
      case TimeUnitEnum.month:
        return time.toDouble();
      case TimeUnitEnum.year:
        return time * 12.0;
      case TimeUnitEnum.day:
        return time / 30.0;
    }
  }
}
