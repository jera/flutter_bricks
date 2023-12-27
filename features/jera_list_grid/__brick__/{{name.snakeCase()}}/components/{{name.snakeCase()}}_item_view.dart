import 'package:flutter/material.dart';

abstract class {{name.pascalCase()}}ItemViewModelProtocol {
  String get title;
  void didTapItem();
}

class {{name.pascalCase()}}ItemView extends StatelessWidget {
  final {{name.pascalCase()}}ItemViewModelProtocol viewModel;

  const {{name.pascalCase()}}ItemView({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: viewModel.didTapItem,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.teal[600],
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.all(8),
        child: Text(viewModel.title),
      ),
    );
  }
}
