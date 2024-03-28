import 'package:flutter/material.dart';

abstract class ProfileViewModelProtocol with ChangeNotifier {
  String get name;
  String get email;

  void didTapGoBack();
  void didTapEditProfile();
}

class ProfileView extends StatelessWidget {
  final ProfileViewModelProtocol viewModel;

  const ProfileView({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: viewModel.didTapGoBack,
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: viewModel.didTapEditProfile,
            icon: const Icon(Icons.edit, size: 24),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.person,
                    size: 40,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  viewModel.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                viewModel.email,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
