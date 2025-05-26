import 'package:fin_calc/src/core/core.dart';
import 'package:fin_calc/src/presentation/setting/setting_screen.dart';
import 'package:go_router/go_router.dart';

class SettingRoute {
  static final GoRoute route = GoRoute(
    name: AppRouter.SETTING_ROOT.name,
    path: AppRouter.SETTING_ROOT.path,
    builder: (context, state) {
      return const SettingScreen();
    },
    routes: const [],
  );
}
