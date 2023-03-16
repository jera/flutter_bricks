import 'package:flutter/material.dart';

import '../initial_screen_view_controller.dart';
import '../initial_screen_view_model.dart';

class InitialScreenFactory {
  static const String initialScreenRoute = 'initial_screen_route';

  static StatefulWidget initialScreen() {
    final viewModel = InitialScreenViewModel();
    return InitialScreenViewController(viewModel: viewModel);
  }
}
