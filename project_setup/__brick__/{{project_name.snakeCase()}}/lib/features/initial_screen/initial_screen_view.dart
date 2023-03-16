import 'package:flutter/material.dart';

abstract class InitialScreenViewModelProtocol extends ChangeNotifier {}

class InitialScreenView extends StatelessWidget {
  final InitialScreenViewModelProtocol viewModel;
  const InitialScreenView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Initial Screen'),
      ),
    );
  }
}
