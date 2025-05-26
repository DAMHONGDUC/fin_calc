class InstallmentMonthlyModel {
  final int month;
  final double principal;
  final double interest;
  final double totalPayment;
  final double remainingBalance;

  InstallmentMonthlyModel({
    required this.month,
    required this.principal,
    required this.interest,
    required this.totalPayment,
    required this.remainingBalance,
  });
}
