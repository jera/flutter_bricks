import 'package:flutter/material.dart';

import '../../support/utils/service_locator/service_locator.dart';
import '{{name.snakeCase()}}_view.dart';

abstract class {{name.pascalCase()}}Protocol extends {{name.pascalCase()}}ViewModelProtocol {
  void Function(String dataTitle)? navigateToDetails;
}

class {{name.pascalCase()}}ViewController extends StatefulWidget {
  const {{name.pascalCase()}}ViewController({super.key});

  @override
  State<{{name.pascalCase()}}ViewController> createState() => _{{name.pascalCase()}}ViewControllerState();
}

class _{{name.pascalCase()}}ViewControllerState extends State<{{name.pascalCase()}}ViewController> {
  final viewModel = ServiceLocator.get<{{name.pascalCase()}}Protocol>();

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  Widget build(BuildContext context) {
    return {{name.pascalCase()}}View(viewModel: viewModel);
  }

  void _bind() {
    viewModel.navigateToDetails = (dataTitle) {
      Navigator.pushNamed(
        context,
        // TODO: Chamar a tela de detalhe da listagem aqui
        '',
        arguments: dataTitle,
      );
    };
  }
}
