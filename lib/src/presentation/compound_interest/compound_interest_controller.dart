import 'package:fin_calc/src/core/core.dart';
import 'package:fin_calc/src/domain/domain.dart';
import 'package:fin_calc/src/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:system_design_flutter/index.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'compound_interest_state.dart';
part 'compound_interest_event.dart';

class CompoundInterestController
    extends Bloc<CompoundInterestEvent, CompoundInterestState> {
  CompoundInterestController() : super(CompoundInterestInitState()) {
    on<CalculateCompoundInterestEvent>(
      _onCalculateInterest,
      transformer: sequential(),
    );
    on<CompoundInterestShareResultEvent>(_onShareResult);
  }

  Future<void> _onCalculateInterest(
    CalculateCompoundInterestEvent event,
    Emitter<CompoundInterestState> emit,
  ) async {
    CompoundInterestLoadingState(data: state.data);

    await SdHelper.delay(milliseconds: 200);

    final result = FinanceHelper.finalCompoundBalance(
      principalAmount: event.compoundInterest.principalAmount,
      monthlyContribution: event.compoundInterest.monthlyContribution,
      rate: event.compoundInterest.rate,
      frequency: event.compoundInterest.frequency.value,
      timeInYears: event.compoundInterest.timeUnit.toYears(
        event.compoundInterest.time,
      ),
    );

    emit(
      CompoundInterestCalculatedState(
        data: state.data.copyWith(
          totalAmount: result,
          compoundInterest: event.compoundInterest,
        ),
      ),
    );
  }

  void _onShareResult(
    CompoundInterestShareResultEvent event,
    Emitter<CompoundInterestState> emit,
  ) {
    ShareHelper.shareCompoundInterest(
      compoundInterest: state.data.compoundInterest,
      totalAmount: state.data.totalAmount,
    );
  }
}
