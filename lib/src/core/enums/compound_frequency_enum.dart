enum CompoundFrequencyEnum { annually, semiAnnually, quarterly, monthly, daily }

extension CompoundFrequencyExtension on CompoundFrequencyEnum {
  int get value {
    switch (this) {
      case CompoundFrequencyEnum.annually:
        return 1;
      case CompoundFrequencyEnum.semiAnnually:
        return 2;
      case CompoundFrequencyEnum.quarterly:
        return 4;
      case CompoundFrequencyEnum.monthly:
        return 12;
      case CompoundFrequencyEnum.daily:
        return 365;
    }
  }

  String get title {
    switch (this) {
      case CompoundFrequencyEnum.annually:
        return 'Annually';
      case CompoundFrequencyEnum.semiAnnually:
        return 'Semiannually';
      case CompoundFrequencyEnum.quarterly:
        return 'Quarterly';
      case CompoundFrequencyEnum.monthly:
        return 'Monthly';
      case CompoundFrequencyEnum.daily:
        return 'Daily';
    }
  }
}
