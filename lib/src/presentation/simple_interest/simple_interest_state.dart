part of 'simple_interest_controller.dart';

class _Data extends Equatable {
  const _Data({required this.simpleInterest, required this.totalAmount});

  final SimpleInterestModel simpleInterest;
  final double totalAmount;

  _Data copyWith({SimpleInterestModel? simpleInterest, double? totalAmount}) {
    return _Data(
      simpleInterest: simpleInterest ?? this.simpleInterest,
      totalAmount: totalAmount ?? this.totalAmount,
    );
  }

  factory _Data.init() {
    return _Data(simpleInterest: SimpleInterestModel.init(), totalAmount: 0);
  }

  @override
  List<Object> get props => [simpleInterest, totalAmount];
}

abstract class SimpleInterestState extends Equatable {
  const SimpleInterestState({required this.data});
  final _Data data;

  @override
  List<Object> get props => [];
}

class SimpleInterestInitial extends SimpleInterestState {
  SimpleInterestInitial() : super(data: _Data.init());
}

class SimpleInterestLoadingState extends SimpleInterestState {
  const SimpleInterestLoadingState({required super.data});
}

class SimpleInterestCalculatedState extends SimpleInterestState {
  const SimpleInterestCalculatedState({required super.data});
}
