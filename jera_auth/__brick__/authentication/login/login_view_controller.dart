import '../di/auth_factory.dart';
import 'package:flutter/material.dart';

import 'login_view.dart';

abstract class LoginProtocol extends LoginViewModelProtocol {
  VoidCallback? onSuccessLogin;
  VoidCallback? onCanceledLogin;
  VoidCallback? onGoToRegister;
  void Function(String error)? onFailureLogin;
}

class LoginViewController extends StatefulWidget {
  final LoginProtocol viewModel;
  const LoginViewController({super.key, required this.viewModel});

  @override
  State<LoginViewController> createState() => _LoginViewControllerState();
}

class _LoginViewControllerState extends State<LoginViewController> {
  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  Widget build(BuildContext context) {
    return LoginView(viewModel: widget.viewModel);
  }

  /// Bind
  void _bind() {
    widget.viewModel.onSuccessLogin = () {
      //TODO: implementar
    };

    widget.viewModel.onFailureLogin = (error) {
      //TODO: implementar
    };

    widget.viewModel.onGoToRegister = () {
      Navigator.of(context).pushNamed(AuthFactory.registerRoute);
    };
  }
}
