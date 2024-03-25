import 'package:flutter/material.dart';

abstract class EditProfileViewModelProtocol with ChangeNotifier {
  String get name;
  String get email;
  bool get canSubmit;
  String get avatarUrl;

  String? nameValidator();
  String? emailValidator();

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
      body: GestureDetector(
        onTap: FocusManager.instance.primaryFocus?.unfocus,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: InkWell(
                    onTap: viewModel.didTapEditAvatar,
                    borderRadius: BorderRadius.circular(50),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        /// Adicionar avatar
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
                  validator: (_) => viewModel.nameValidator(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: 'Nome...',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.red, width: 1.4),
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
                  validator: (_) => viewModel.emailValidator(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: 'Email...',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.red, width: 1.4),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.red),
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
                const SizedBox(height: 24),
                ListenableBuilder(
                  listenable: viewModel,
                  builder: (_, __) {
                    return ElevatedButton(
                      onPressed: viewModel.canSubmit ? viewModel.didTapSaveData : null,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      child: const Text(
                        'Salvar',
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    );
                  },
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
