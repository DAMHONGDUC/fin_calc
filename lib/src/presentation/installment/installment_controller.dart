import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:fin_calc/src/core/core.dart';
import 'package:fin_calc/src/domain/domain.dart';
import 'package:fin_calc/src/utils/utils.dart';
import 'package:system_design_flutter/index.dart';

part 'installment_event.dart';
part 'installment_state.dart';

class InstallmentController extends Bloc<InstallmentEvent, InstallmentState> {
  InstallmentController() : super(InstallmentInitial()) {
    on<CalculateInstallmentEvent>(_onCalculate, transformer: sequential());
    on<InstallmentShareResultEvent>(_onShareResult);
  }

  Future<void> _onCalculate(
    CalculateInstallmentEvent event,
    Emitter<InstallmentState> emit,
  ) async {
    emit(InstallmentLoadingState(data: state.data));

    await SdHelper.delay(milliseconds: 200);

    final installmentTable = FinanceHelper.generatePMTInstallmentTable(
      loanAmount: event.installmentModel.loanAmount,
      rate: event.installmentModel.rate,
      totalMonths: event.installmentModel.timeUnit.toMonths(
        event.installmentModel.time,
      ),
    );

    emit(
      InstallmentCalculatedState(
        data: state.data.copyWith(
          installmentModel: event.installmentModel,
          installmentTable: installmentTable,
          totalAmount: FinanceHelper.calculateTotalPayment(installmentTable),
        ),
      ),
    );
  }

  void _onShareResult(
    InstallmentShareResultEvent event,
    Emitter<InstallmentState> emit,
  ) {
    // // Implement sharing logic here, like sharing the installment details
    // ShareHelper.shareInstallmentDetails(
    //   installment: state.data,
    //   installmentTable: state.installmentTable,
    // );
  }
}
