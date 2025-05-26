import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_design_flutter/index.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (kDebugMode) {
      SdLog.printWarning(
        '[BLOC] ==> ${bloc.runtimeType} created',
        showMsgWrap: false,
      );
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      SdLog.printWarning(
        '[BLOC] ==> ${bloc.runtimeType}: [${change.currentState.runtimeType}] --> [${change.nextState.runtimeType}]',
        showMsgWrap: false,
      );
    }
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (kDebugMode) {
      SdLog.printWarning(
        '[BLOC] ==> $event is added to ${bloc.runtimeType}',
        showMsgWrap: false,
      );
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (kDebugMode) {
      SdLog.printWarning(
        '[BLOC] ==> ${bloc.runtimeType} has errors. $error',
        showMsgWrap: false,
      );
    }
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    if (kDebugMode) {
      SdLog.printWarning(
        '[BLOC] ==> ${bloc.runtimeType} is closed',
        showMsgWrap: false,
      );
    }
  }
}
