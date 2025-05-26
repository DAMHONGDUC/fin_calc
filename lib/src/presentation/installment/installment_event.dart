part of 'installment_controller.dart';

abstract class InstallmentEvent extends Equatable {
  const InstallmentEvent();

  @override
  List<Object> get props => [];
}

class CalculateInstallmentEvent extends InstallmentEvent {
  final InstallmentModel installmentModel;

  const CalculateInstallmentEvent(this.installmentModel);

  @override
  List<Object> get props => [installmentModel];
}

class InstallmentShareResultEvent extends InstallmentEvent {
  const InstallmentShareResultEvent();

  @override
  List<Object> get props => [];
}
