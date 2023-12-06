import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../support/utils/service_locator/service_locator.dart';

abstract class ForceUpdateViewModelProtocol {
  bool get showIgnoreButton;
  String get storeURL;
  String get description;
}

class ForceUpdateView extends StatefulWidget {
  final bool isRequiredUpdate;
  const ForceUpdateView({required this.isRequiredUpdate, super.key});

  @override
  State<ForceUpdateView> createState() => _ForceUpdateViewState();
}

class _ForceUpdateViewState extends State<ForceUpdateView> {
  late final ForceUpdateViewModelProtocol viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ServiceLocator.get<ForceUpdateViewModelProtocol>(param: widget.isRequiredUpdate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.red,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              const Center(
                child: Icon(
                  Icons.logo_dev_rounded,
                  size: 200,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Existe uma atualização pendente',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(height: 16),
              Text(
                viewModel.description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _openStoreUrl,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  backgroundColor: Colors.black,
                  minimumSize: const Size.fromHeight(50),
                ),
                child: Text(
                  'Atualizar',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              ...ignoreUpdateWidgets()
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> ignoreUpdateWidgets() {
    if (!viewModel.showIgnoreButton) return [];

    return [
      const SizedBox(height: 16),
      TextButton(
        onPressed: _navigateToDismiss,
        style: TextButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        child: Text(
          'Ignorar',
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    ];
  }

  // Action
  void _openStoreUrl() {
    launchUrlString(viewModel.storeURL);
  }

  void _navigateToDismiss() {
    Navigator.pop(context);
  }
}
