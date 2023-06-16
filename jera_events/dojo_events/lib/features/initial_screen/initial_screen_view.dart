import 'package:DojoEvents/support/styles/app_colors.dart';
import 'package:flutter/material.dart';

import '../../localization/localize.dart';

abstract class InitialScreenViewModelProtocol extends ChangeNotifier {
  void didTapEvent();
  void updateEventName(String event);
}

class InitialScreenView extends StatelessWidget {
  final InitialScreenViewModelProtocol viewModel;

  const InitialScreenView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 80),
            const Icon(
              Icons.logo_dev_rounded,
              size: 100,
            ),
            Text(
              l10n.appTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            TextFormField(
              onChanged: viewModel.updateEventName,
              cursorColor: AppColors.black,
              decoration: InputDecoration(
                labelText: "Adicione o nome do evento",
                labelStyle: const TextStyle(color: AppColors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(color: AppColors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(color: AppColors.black),
                ),
                fillColor: AppColors.black,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: viewModel.didTapEvent,
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.black, padding: const EdgeInsets.all(16)),
              child: const Text('DispararEvento'),
            ),
          ],
        ),
      ),
    );
  }
}
