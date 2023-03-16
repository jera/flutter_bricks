
import 'package:flutter/material.dart';

import '../{{name.snakeCase()}}_view_controller.dart';
import '../{{name.snakeCase()}}_view_model.dart';

class {{name.pascalCase()}}Factory {
  final String {{name.camelCase()}}Route = '{{name.snakeCase()}}_route';

  static StatefulWidget {{name.camelCase()}}() {
    final viewModel = {{name.pascalCase()}}ViewModel();
    return {{name.pascalCase()}}ViewController(viewModel: viewModel);
  }
}
