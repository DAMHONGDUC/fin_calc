import 'dart:math';

import 'package:fin_calc/src/domain/domain.dart';

class FinanceHelper {
  static double finalCompoundBalance({
    double principalAmount = 0,
    double monthlyContribution = 0,
    double rate = 1,
    required int frequency,
    required double timeInYears,
  }) {
    final double r = rate / 100;
    final int n = frequency;
    final double PMT = monthlyContribution * 12 / n;

    final double compoundPrincipal =
        principalAmount * pow(1 + r / n, n * timeInYears);
    final double compoundContribution =
        PMT * ((pow(1 + r / n, n * timeInYears) - 1) / (r / n));

    return compoundPrincipal + compoundContribution;
  }

  static double finalSimpleInterestBalance({
    required double principal,
    required double rate,
    required double timeInYears,
  }) {
    final r = rate / 100;
    final interest = principal * r * timeInYears;
    return principal + interest;
  }

  static List<InstallmentMonthlyModel> generatePMTInstallmentTable({
    required double loanAmount,
    required double rate,
    required double totalMonths,
  }) {
    final monthlyRate = rate / 12 / 100;
    final pmt =
        (loanAmount * monthlyRate * pow(1 + monthlyRate, totalMonths)) /
        (pow(1 + monthlyRate, totalMonths) - 1);

    double remainingBalance = loanAmount;
    List<InstallmentMonthlyModel> table = [];

    for (int month = 1; month <= totalMonths; month++) {
      final interest = remainingBalance * monthlyRate;
      final principal = pmt - interest;
      remainingBalance -= principal;

      table.add(
        InstallmentMonthlyModel(
          month: month,
          principal: double.parse(principal.toStringAsFixed(2)),
          interest: double.parse(interest.toStringAsFixed(2)),
          totalPayment: double.parse(pmt.toStringAsFixed(2)),
          remainingBalance: double.parse(
            remainingBalance < 0 ? '0.00' : remainingBalance.toStringAsFixed(2),
          ),
        ),
      );
    }

    return table;
  }

  static double calculateTotalPayment(List<InstallmentMonthlyModel> table) {
    double totalPaid = 0;

    for (var row in table) {
      totalPaid += row.totalPayment;
    }

    return totalPaid;
  }
}
