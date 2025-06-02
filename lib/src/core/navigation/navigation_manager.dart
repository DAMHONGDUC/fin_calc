import 'package:fin_calc/src/core/navigation/setting_route.dart';
import 'package:flutter/material.dart';
import 'package:fin_calc/src/core/navigation/app_router.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';

import 'home_route.dart';

class NavigationManager {
  factory NavigationManager() {
    return _instance;
  }

  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  static final NavigationManager _instance = NavigationManager._internal();
  static NavigationManager get instance => _instance;
  static late final GoRouter router;
  BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;
  GoRouterDelegate get routerDelegate => router.routerDelegate;
  GoRouteInformationParser get routeInformationParser =>
      router.routeInformationParser;

  NavigationManager._internal() {
    router = GoRouter(
      observers: [FlutterSmartDialog.observer],
      navigatorKey: rootNavigatorKey,
      initialLocation: AppRouter.HOME_ROOT.fullPath,
      debugLogDiagnostics: true,
      routes: [HomeRoute.route, SettingRoute.route],
    );
  }
}
