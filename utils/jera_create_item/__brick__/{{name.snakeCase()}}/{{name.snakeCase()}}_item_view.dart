import 'package:flutter/material.dart';

abstract class {{name.pascalCase()}}ItemViewModelProtocol extends ChangeNotifier {}

class {{name.pascalCase()}}ItemView extends StatelessWidget {
  final {{name.pascalCase()}}ItemViewModelProtocol viewModel;
  const {{name.pascalCase()}}ItemView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return const Column(children: []);
  }
}
