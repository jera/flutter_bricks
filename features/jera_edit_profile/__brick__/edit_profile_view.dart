import 'package:flutter/material.dart';

import '../../../support/utils/service_locator/service_locator.dart';
import 'edit_profile_view_controller.dart';

abstract class EditProfileViewModelProtocol with ChangeNotifier {
  String get name;
  String get email;
  String get avatarUrl;

  void didTapGoBack();
  void didTapSettings();
  void didTapSaveData();
  void didTapEditAvatar();
  void updateName(String text);
  void updateEmail(String text);
}

class EditProfileView extends StatelessWidget {
  final EditProfileViewModelProtocol viewModel;

  const EditProfileView({required this.viewModel, super.key});

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
            onPressed: viewModel.didTapSettings,
            icon: const Icon(Icons.settings, size: 24),
          ),
        ],
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: viewModel.didTapEditAvatar,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.person,
                            size: 40,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(32),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.4),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.edit,
                            size: 24,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  initialValue: viewModel.name,
                  onChanged: viewModel.updateName,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  initialValue: viewModel.email,
                  onChanged: viewModel.updateEmail,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                    ),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: viewModel.didTapSaveData,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text(
                    'Salvar',
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
