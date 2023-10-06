{{#with_go_router}}
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';{{/with_go_router}}
{{^with_go_router}}
import 'package:flutter/material.dart';
import '../features/force_update/di/force_update_module.dart';
import '../features/initial_screen/di/initial_screen_module.dart';{{/with_go_router}}
import '../features/force_update/force_update_view.dart';
import '../features/initial_screen/initial_screen_view_controller.dart';
{{#with_go_router}}

abstract class AppRouter {
  List<RouteBase> get routes;
}

class MobileRouter {
  static final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

  static const String initialScreenRoute = '/initial_screen_route';
  static const String forceUpdateRoute = '/force_update';

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: initialScreenRoute,
    routes: <RouteBase>[
      GoRoute(
        path: initialScreenRoute,
        name: initialScreenRoute,
        builder: (_, __) => const InitialScreenViewController(),
      ),
      GoRoute(
        path: forceUpdateRoute,
        name: forceUpdateRoute,
        builder: (_, state) {
          final isRequiredUpdate = state.extra as bool;
          return ForceUpdateView(
            isRequiredUpdate: isRequiredUpdate,
          );
        },
      ),
    ],
  );

  static void redirectToForceUpdate({required bool isRequiredVersion}) {
    final context = MobileRouter.rootNavigatorKey.currentContext;
    if (context == null) return;

    context.goNamed(forceUpdateRoute);
  }
}{{/with_go_router}}
{{^with_go_router}}
class MobileRouter {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  
  static const String initialRoute = InitialScreenModule.initialScreenRoute;

  static final Map<String, WidgetBuilder> routes = {
    InitialScreenModule.initialScreenRoute: (_) => const InitialScreenViewController(),

    ForceUpdateModule.forceUpdateRoute: (context) {
      final isRequiredUpdate = ModalRoute.of(context)?.settings.arguments as bool;
      return ForceUpdateView(isRequiredUpdate: isRequiredUpdate);
  },
  };

  static void redirectToForceUpdate({required bool isRequiredVersion}) {
    final predicate = ModalRoute.withName('/');
    final context = MobileRouter.navigatorKey.currentContext;

    if (context == null) return;

    if (isRequiredVersion) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        ForceUpdateModule.forceUpdateRoute,
        predicate,
        arguments: isRequiredVersion,
      );
    } else {
      Navigator.pushNamed(
        context,
        ForceUpdateModule.forceUpdateRoute,
        arguments: isRequiredVersion,
      );
    }
  }
}
{{/with_go_router}}