import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:fin_calc/src/core/core.dart';
import 'package:fin_calc/src/domain/domain.dart';
import 'package:fin_calc/src/utils/utils.dart';
import 'package:system_design_flutter/index.dart';

part 'simple_interest_event.dart';
part 'simple_interest_state.dart';

class SimpleInterestController
    extends Bloc<SimpleInterestEvent, SimpleInterestState> {
  SimpleInterestController() : super(SimpleInterestInitial()) {
    on<CalculateSimpleInterestEvent>(_onCalculate, transformer: sequential());
    on<SimpleInterestShareResultEvent>(_onShareResult);
  }

  Future<void> _onCalculate(
    CalculateSimpleInterestEvent event,
    Emitter<SimpleInterestState> emit,
  ) async {
    emit(SimpleInterestLoadingState(data: state.data));

    await SdHelper.delay(milliseconds: 200);

    final result = FinanceHelper.finalSimpleInterestBalance(
      principal: event.simpleInterest.principalAmount,
      rate: event.simpleInterest.rate,
      timeInYears: event.simpleInterest.timeUnit.toYears(
        event.simpleInterest.time,
      ),
    );

    emit(
      SimpleInterestCalculatedState(
        data: state.data.copyWith(
          simpleInterest: event.simpleInterest,
          totalAmount: result,
        ),
      ),
    );
  }

  void _onShareResult(
    SimpleInterestShareResultEvent event,
    Emitter<SimpleInterestState> emit,
  ) {
    ShareHelper.shareSimpleInterest(
      simpleInterest: state.data.simpleInterest,
      totalAmount: state.data.totalAmount,
    );
  }
}
