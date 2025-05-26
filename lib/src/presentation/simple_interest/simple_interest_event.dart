part of 'simple_interest_controller.dart';

abstract class SimpleInterestEvent extends Equatable {
  const SimpleInterestEvent();

  @override
  List<Object> get props => [];
}

class CalculateSimpleInterestEvent extends SimpleInterestEvent {
  final SimpleInterestModel simpleInterest;
  const CalculateSimpleInterestEvent(this.simpleInterest);

  @override
  List<Object> get props => [simpleInterest];
}

class SimpleInterestShareResultEvent extends SimpleInterestEvent {
  const SimpleInterestShareResultEvent();
}
