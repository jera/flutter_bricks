import 'package:FlutterProject/features/initial_screen/di/initial_screen_factory.dart';
import 'package:flutter/material.dart';

class MobileRouter {
  static const String initialRoute = InitialScreenFactory.initialScreenRoute;

  static final Map<String, WidgetBuilder> routes = {
    InitialScreenFactory.initialScreenRoute: (_) => InitialScreenFactory.initialScreen(),
  };
}
