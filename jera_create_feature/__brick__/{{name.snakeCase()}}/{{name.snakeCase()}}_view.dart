import 'package:flutter/material.dart';

abstract class {{name.pascalCase()}}ViewModelProtocol extends ChangeNotifier {}

class {{name.pascalCase()}}View extends StatelessWidget {
  final {{name.pascalCase()}}ViewModelProtocol viewModel;
  const {{name.pascalCase()}}View({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
