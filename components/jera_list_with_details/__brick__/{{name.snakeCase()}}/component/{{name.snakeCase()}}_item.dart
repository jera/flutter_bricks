import 'package:flutter/material.dart';

abstract class {{name.pascalCase()}}ItemViewModelProtocol {
  String get title;

  void onTap();
}

class {{name.pascalCase()}}Item extends StatelessWidget {
  final {{name.pascalCase()}}ItemViewModelProtocol viewModel;

  const {{name.pascalCase()}}Item({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: viewModel.onTap,
      child: Card(
        color: Colors.grey.shade300,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                viewModel.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 12),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.grey.shade800,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
