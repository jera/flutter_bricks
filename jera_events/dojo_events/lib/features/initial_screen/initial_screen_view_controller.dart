import 'package:flutter/src/widgets/framework.dart';

import 'initial_screen_view.dart';

abstract class InitialScreenProtocol extends InitialScreenViewModelProtocol {}

class InitialScreenViewController extends StatefulWidget {
  final InitialScreenProtocol viewModel;
  const InitialScreenViewController({super.key, required this.viewModel});

  @override
  State<InitialScreenViewController> createState() => _InitialScreenViewControllerState();
}

class _InitialScreenViewControllerState extends State<InitialScreenViewController> {
  @override
  Widget build(BuildContext context) {
    return InitialScreenView(viewModel: widget.viewModel);
  }
}
