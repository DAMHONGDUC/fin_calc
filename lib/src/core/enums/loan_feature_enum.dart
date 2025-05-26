import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

enum LoanFeatureEnum { compoundInterest, simpleInterest, installment }

extension LoanFeatureEnumExtension on LoanFeatureEnum {
  String get title {
    switch (this) {
      case LoanFeatureEnum.compoundInterest:
        return 'Compound Interest';
      case LoanFeatureEnum.installment:
        return 'Installment Calculator';
      case LoanFeatureEnum.simpleInterest:
        return 'Simple Interest';
    }
  }

  String get description {
    switch (this) {
      case LoanFeatureEnum.compoundInterest:
        return 'Calculate on principal and interest';
      case LoanFeatureEnum.installment:
        return 'Calculate periodic payments';
      case LoanFeatureEnum.simpleInterest:
        return 'Calculate on principal only';
    }
  }

  IconData get iconData {
    switch (this) {
      case LoanFeatureEnum.compoundInterest:
        return Symbols.monitoring;
      case LoanFeatureEnum.installment:
        return Icons.paid;
      case LoanFeatureEnum.simpleInterest:
        return Icons.savings;
    }
  }
}
