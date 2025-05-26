part of 'compound_interest_controller.dart';

class _Data extends Equatable {
  const _Data({required this.compoundInterest, required this.totalAmount});

  final CompoundInterestModel compoundInterest;
  final double totalAmount;

  _Data copyWith({
    CompoundInterestModel? compoundInterest,
    double? totalAmount,
  }) {
    return _Data(
      compoundInterest: compoundInterest ?? this.compoundInterest,
      totalAmount: totalAmount ?? this.totalAmount,
    );
  }

  factory _Data.init() {
    return _Data(
      compoundInterest: CompoundInterestModel.init(),
      totalAmount: 0,
    );
  }

  @override
  List<Object> get props => [compoundInterest, totalAmount];
}

abstract class CompoundInterestState extends Equatable {
  final _Data data;

  const CompoundInterestState({required this.data});

  @override
  List<Object?> get props => [data];
}

class CompoundInterestInitState extends CompoundInterestState {
  CompoundInterestInitState() : super(data: _Data.init());
}

class CompoundInterestLoadingState extends CompoundInterestState {
  const CompoundInterestLoadingState({required super.data});
}

class CompoundInterestCalculatedState extends CompoundInterestState {
  const CompoundInterestCalculatedState({required super.data});
}
