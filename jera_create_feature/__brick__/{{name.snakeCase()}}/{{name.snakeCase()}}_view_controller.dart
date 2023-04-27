import 'package:flutter/src/widgets/framework.dart';

import '{{name.snakeCase()}}_view.dart';

abstract class {{name.pascalCase()}}Protocol extends {{name.pascalCase()}}ViewModelProtocol {}

class {{name.pascalCase()}}ViewController extends StatefulWidget {
  final {{name.pascalCase()}}Protocol viewModel;
  const {{name.pascalCase()}}ViewController({super.key, required this.viewModel});

  @override
  State<{{name.pascalCase()}}ViewController> createState() => _{{name.pascalCase()}}ViewControllerState();
}

class _{{name.pascalCase()}}ViewControllerState extends State<{{name.pascalCase()}}ViewController> {
  @override
  Widget build(BuildContext context) {
    return {{name.pascalCase()}}View(viewModel: widget.viewModel);
  }
}
