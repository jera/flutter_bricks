import 'package:flutter/material.dart';

import '../../localization/localize.dart';

abstract class InitialScreenViewModelProtocol extends ChangeNotifier {}

class InitialScreenView extends StatelessWidget {
  final InitialScreenViewModelProtocol viewModel;

  const InitialScreenView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.logo_dev_rounded,
            size: 100,
          ),
          Text(
            l10n.appTitle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
