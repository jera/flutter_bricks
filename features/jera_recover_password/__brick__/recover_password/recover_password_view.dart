abstract class RecoverPasswordViewModelProtocol with ChangeNotifier {
  bool get canSubmit;
  bool get isLoading;

  void didTapBack();
  void didTapRecoverPassword();
  void updateEmail(String email);
  // TODO: Verificar necessidade do validator
  // String? emailValidator(String? email);
}

class RecoverPasswordView extends StatelessWidget {
  final RecoverPasswordViewModelProtocol viewModel;

  const RecoverPasswordView({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: viewModel.didTapBack,
          child: const Icon(Icons.arrow_back),
        ),
        title: const Text('Recuperar Senha'),
      ),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (_, __) {
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                const Icon(Icons.logo_dev_outlined, size: 128), // TODO: Substituir pela logo do seu app
                const SizedBox(height: 56),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Informe o ',
                      ),
                      TextSpan(
                        text: 'e-mail do cadastro ',
                        style: TextStyle(color: Colors.green),
                      ),
                      TextSpan(text: 'para receber as informações de recuperação de senha!'),
                    ],
                  ),
                ),
                const SizedBox(height: 56),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: viewModel.updateEmail,
                  cursorColor: Colors.green,
                  // TODO: Verificar necessidade do validator
                  // validator: viewModel.emailValidator,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    contentPadding: EdgeInsets.all(12),
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    // errorText: errorText,
                  ),
                ),
                const SizedBox(height: 56),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(16),
                  ),
                  onPressed: viewModel.canSubmit ? viewModel.didTapRecoverPassword : null,
                  child: _buttonChild,
                ),
                const SizedBox(height: 16),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.green,
                  ),
                  onPressed: viewModel.didTapBack,
                  child: const Text('Voltar'),
                ),
                const Spacer(flex: 2),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget get _buttonChild {
    if (viewModel.isLoading) {
      return const CircularProgressIndicator();
    }

    return const Text('Recuperar senha');
  }
}
