import 'package:flutter/src/widgets/framework.dart';

import 'register_view.dart';

abstract class RegisterProtocol extends RegisterViewModelProtocol {
  VoidCallback? onSuccessRegister;
  VoidCallback? onCanceledRegister;
  void Function(String error)? onFailureRegister;
}

class RegisterViewController extends StatefulWidget {
  final RegisterProtocol viewModel;
  const RegisterViewController({super.key, required this.viewModel});

  @override
  State<RegisterViewController> createState() => _RegisterViewControllerState();
}

class _RegisterViewControllerState extends State<RegisterViewController> {
  @override
  Widget build(BuildContext context) {
    return RegisterView(viewModel: widget.viewModel);
  }
}
