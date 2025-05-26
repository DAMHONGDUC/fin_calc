part of 'installment_controller.dart';

class _Data extends Equatable {
  const _Data({
    required this.installmentModel,
    required this.installmentTable,
    required this.totalAmount,
  });

  final InstallmentModel installmentModel;
  final List<InstallmentMonthlyModel> installmentTable;
  final double totalAmount;

  _Data copyWith({
    InstallmentModel? installmentModel,
    List<InstallmentMonthlyModel>? installmentTable,
    double? totalAmount,
  }) {
    return _Data(
      installmentModel: installmentModel ?? this.installmentModel,
      installmentTable: installmentTable ?? this.installmentTable,
      totalAmount: totalAmount ?? this.totalAmount,
    );
  }

  factory _Data.init() {
    return _Data(
      installmentModel: InstallmentModel.init(),
      installmentTable: const [],
      totalAmount: 0,
    );
  }

  @override
  List<Object> get props => [installmentModel, installmentTable];
}

abstract class InstallmentState extends Equatable {
  const InstallmentState({required this.data});
  final _Data data;

  @override
  List<Object> get props => [data];
}

class InstallmentInitial extends InstallmentState {
  InstallmentInitial() : super(data: _Data.init());
}

class InstallmentLoadingState extends InstallmentState {
  const InstallmentLoadingState({required super.data});
}

class InstallmentCalculatedState extends InstallmentState {
  const InstallmentCalculatedState({required super.data});
}
