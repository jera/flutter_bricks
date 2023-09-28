import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

abstract class ForceUpdateViewModelProtocol {
  bool get showIgnoreButton;
  String get storeURL;
  String get title;
  String get description;
  String get updateActionTitle;
  String get skipActionTitle;
}

class ForceUpdateView extends StatefulWidget {
  final ForceUpdateViewModelProtocol viewModel;

  const ForceUpdateView({super.key, required this.viewModel});

  @override
  State<ForceUpdateView> createState() => _ForceUpdateViewState();
}

class _ForceUpdateViewState extends State<ForceUpdateView> {
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
                widget.viewModel.title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(height: 16),
              Text(
                widget.viewModel.description,
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
                  widget.viewModel.updateActionTitle,
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
    if (!widget.viewModel.showIgnoreButton) return [];

    return [
      const SizedBox(height: 16),
      TextButton(
        onPressed: _navigateToDismiss,
        style: TextButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        child: Text(
          widget.viewModel.skipActionTitle,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    ];
  }

  // Action
  void _openStoreUrl() {
    launchUrlString(widget.viewModel.storeURL);
  }

  void _navigateToDismiss() {
    Navigator.pop(context);
  }
}
