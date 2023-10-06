import 'package:flutter/material.dart';

import '../../support/utils/service_locator/service_locator.dart';
import 'initial_screen_view.dart';

abstract class InitialScreenProtocol extends InitialScreenViewModelProtocol {}

class InitialScreenViewController extends StatefulWidget {
  const InitialScreenViewController({super.key});

  @override
  State<InitialScreenViewController> createState() => _InitialScreenViewControllerState();
}

class _InitialScreenViewControllerState extends State<InitialScreenViewController> {
  final viewModel = ServiceLocator.get<InitialScreenProtocol>();

  @override
  Widget build(BuildContext context) {
    return InitialScreenView(viewModel: viewModel);
  }
}
