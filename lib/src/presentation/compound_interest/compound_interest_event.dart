part of 'compound_interest_controller.dart';

abstract class CompoundInterestEvent extends Equatable {
  const CompoundInterestEvent();

  @override
  List<Object?> get props => [];
}

class CalculateCompoundInterestEvent extends CompoundInterestEvent {
  final CompoundInterestModel compoundInterest;

  const CalculateCompoundInterestEvent(this.compoundInterest);

  @override
  List<Object?> get props => [compoundInterest];
}

class CompoundInterestShareResultEvent extends CompoundInterestEvent {
  const CompoundInterestShareResultEvent();
}
