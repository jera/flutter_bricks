import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../support/utils/service_locator/service_locator.dart';
import '../components/default_text_field.dart';
import 'components/default_submit_button.dart';
import 'components/eye_password_icon.dart';
import 'components/mask_formatters.dart';

abstract class RegisterViewModelProtocol extends ChangeNotifier {
  bool get isLoading;
  bool get isObscurePassword;
  bool get isObscureConfirmPassword;

  String? get nameErrorText;
  String? get emailErrorText;
  String? get phoneErrorText;
  String? get documentErrorText;
  String? get passwordErrorText;
  String? get confirmPasswordErrorText;

  void updateName(String name);
  void updateEmail(String email);
  void updatePhone(String phone);
  void updateDocument(String document);
  void updatePassword(String password);
  void updateConfirmPassword(String confirmPassword);

  void didTapShowPassword();
  void didTapFormValidator();
  void didTapShowConfirmPassword();

  VoidCallback? onSuccessRegister;
  VoidCallback? onCanceledRegister;
  void Function(String error)? onFailureRegister;
}

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final RegisterViewModelProtocol viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ServiceLocator.get<RegisterViewModelProtocol>();
    _bind();
  }

  void _bind() {
    viewModel.onSuccessRegister = () {
      //TODO: implementar
    };

    viewModel.onFailureRegister = (error) {
      //TODO: implementar
    };

    viewModel.onCanceledRegister = () {
      //TODO: implementar
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: GestureDetector(
                onTap: context.pop,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: const EdgeInsets.only(left: 16, top: 12),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
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
                          hint: 'Nome Completo',
                          autoCorrect: false,
                          onChanged: viewModel.updateName,
                          errorText: viewModel.nameErrorText,
                        ),
                        const SizedBox(height: 32),
                        DefaultTextField(
                          hint: 'Email',
                          autoCorrect: false,
                          onChanged: viewModel.updateEmail,
                          errorText: viewModel.emailErrorText,
                        ),
                        const SizedBox(height: 32),
                        DefaultTextField(
                          hint: 'Celular',
                          autoCorrect: false,
                          onChanged: viewModel.updatePhone,
                          errorText: viewModel.phoneErrorText,
                          keyboardType: TextInputType.number,
                          inputFormatters: [MaskFormatters.phoneNumberMask],
                        ),
                        const SizedBox(height: 32),
                        DefaultTextField(
                          hint: 'CPF',
                          autoCorrect: false,
                          onChanged: viewModel.updateDocument,
                          errorText: viewModel.documentErrorText,
                          keyboardType: TextInputType.number,
                          inputFormatters: [MaskFormatters.cpfNumberMask],
                        ),
                        const SizedBox(height: 32),
                        DefaultTextField(
                          hint: 'Senha',
                          isPassword: viewModel.isObscurePassword,
                          autoCorrect: false,
                          onChanged: viewModel.updatePassword,
                          errorText: viewModel.passwordErrorText,
                          suffixIcon: EyePasswordIcon(
                            onTap: viewModel.didTapShowPassword,
                            isObscureText: viewModel.isObscurePassword,
                          ),
                        ),
                        const SizedBox(height: 32),
                        DefaultTextField(
                          hint: 'Confirmar senha',
                          isPassword: viewModel.isObscurePassword,
                          autoCorrect: false,
                          onChanged: viewModel.updateConfirmPassword,
                          errorText: viewModel.confirmPasswordErrorText,
                          suffixIcon: EyePasswordIcon(
                            onTap: viewModel.didTapShowConfirmPassword,
                            isObscureText: viewModel.isObscureConfirmPassword,
                          ),
                        ),
                        const Spacer(),
                        DefaultSubmitButton(
                          label: 'Criar conta',
                          isLoading: viewModel.isLoading,
                          onPressed: viewModel.didTapFormValidator,
                        ),
                        const Spacer(),
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
