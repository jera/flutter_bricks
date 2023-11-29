import 'package:flutter/material.dart';

import '../../../support/utils/service_locator/service_locator.dart';
import '../components/default_text_field.dart';{{#has_social}}
import '../components/social_icon_button.dart';{{/has_social}}

abstract class LoginViewModelProtocol extends ChangeNotifier {
  bool get isLoading;
  bool get isEnableSubmit;
  bool get isObscurePassword;
  void updateEmail(String email);
  void updatePassword(String password);
  void didTapLogin();
  void didTapShowPassword();
  void didTapGoToRegister();{{#has_apple}}
  void didTapLoginApple();{{/has_apple}}{{#has_google}}
  void didTapLoginGoogle();{{/has_google}}{{#has_facebook}}
  void didTapLoginFacebook();{{/has_facebook}}

  VoidCallback? onSuccessLogin;
  VoidCallback? onCanceledLogin;
  VoidCallback? onGoToRegister;
  void Function(String error)? onFailureLogin;
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final LoginViewModelProtocol viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ServiceLocator.get<LoginViewModelProtocol>();
    _bind();
  }

  void _bind() {
    viewModel.onSuccessLogin = () {
      //TODO: implementar
    };

    viewModel.onFailureLogin = (error) {
      //TODO: implementar
    };
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: ListenableBuilder(
                      listenable: viewModel,
                      builder: (_, __) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Spacer(),
                            const Center(child: Icon(Icons.logo_dev)),
                            const Spacer(),
                            DefaultTextField(
                              hint: 'Email',
                              autoCorrect: false,
                              onChanged: viewModel.updateEmail,
                            ),
                            const SizedBox(height: 32),
                            DefaultTextField(
                              hint: 'Senha',
                              isPassword: viewModel.isObscurePassword,
                              autoCorrect: false,
                              onChanged: viewModel.updatePassword,
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                SizedBox(
                                  width: 32,
                                  height: 24,
                                  child: Checkbox(
                                    value: viewModel.isObscurePassword,
                                    checkColor: Colors.white,
                                    side: const BorderSide(color: Colors.green),
                                    fillColor: const MaterialStatePropertyAll(Colors.green),
                                    onChanged: (_) => viewModel.didTapShowPassword(),
                                  ),
                                ),
                                const Expanded(
                                  child: Text(
                                    'Mostrar senha',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.grey, fontSize: 16),
                                  ),
                                ),
                                const SizedBox(width: 24),
                                const Expanded(
                                  child: Text(
                                    'Esqueci minha senha',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 14,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 32),
                            ElevatedButton(
                              onPressed: _submit,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                padding: const EdgeInsets.all(16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              child: _submitWidget,
                            ),
                            const SizedBox(height: 16),
                            TextButton(
                              onPressed: viewModel.didTapGoToRegister,
                              child: const Text(
                                'Quero me cadastrar',
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.green,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            const SizedBox(height: 28),{{#has_facebook}}
                            SocialIconButton(
                              label: 'Entrar com o facebook',
                              asset: const Icon(Icons.facebook),
                              onTap: viewModel.didTapLoginFacebook,
                            ),{{/has_facebook}}
                            const SizedBox(height: 16),{{#has_google}}
                            SocialIconButton(
                              label: 'Entrar com o google',
                              asset: const Icon(Icons.g_mobiledata_rounded),
                              onTap: viewModel.didTapLoginGoogle,
                            ),{{/has_google}}
                            const SizedBox(height: 16),{{#has_apple}}
                            SocialIconButton(
                              label: 'Entrar com a apple',
                              asset: const Icon(Icons.apple),
                              onTap: viewModel.didTapLoginApple,
                            ),{{/has_apple}}
                            const Spacer(),
                          ],
                        );
                      },
                    ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _submitWidget {
    return viewModel.isLoading
        ? const CircularProgressIndicator(color: Colors.white)
        : const Text(
            'Entrar',
            style: TextStyle(color: Colors.white),
          );
  }

  void Function()? get _submit {
    return viewModel.isEnableSubmit ? viewModel.didTapLogin : null;
  }
}
