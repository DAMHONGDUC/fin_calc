import 'package:fin_calc/src/presentation/compound_interest/compound_interest_screen.dart';
import 'package:fin_calc/src/presentation/home/home_screen.dart';
import 'package:fin_calc/src/presentation/installment/installment_screen.dart';
import 'package:fin_calc/src/presentation/simple_interest/simple_interest_screen.dart';
import 'package:go_router/go_router.dart';

import 'app_router.dart';

class HomeRoute {
  static final GoRoute route = GoRoute(
    name: AppRouter.HOME_ROOT.name,
    path: AppRouter.HOME_ROOT.path,
    builder: (context, state) {
      return const HomeScreen();
    },
    routes: [
      GoRoute(
        name: AppRouter.COMPOUND_INTEREST.name,
        path: AppRouter.COMPOUND_INTEREST.path,
        builder: (context, state) {
          return const CompoundInterestScreen();
        },
      ),
      GoRoute(
        name: AppRouter.SIMPLE_INTEREST.name,
        path: AppRouter.SIMPLE_INTEREST.path,
        builder: (context, state) {
          return const SimpleInterestScreen();
        },
      ),
      GoRoute(
        name: AppRouter.INSTALLMENT.name,
        path: AppRouter.INSTALLMENT.path,
        builder: (context, state) {
          return const InstallmentScreen();
        },
      ),
    ],
  );
}
