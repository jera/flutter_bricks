abstract class RecoverPasswordProtocol extends RecoverPasswordViewModelProtocol {
  VoidCallback? onTapBack;
  VoidCallback? onSuccessRecoverPassword;
  ValueChanged<String>? onFailureRecoverPassword;
}

class RecoverPasswordViewController extends StatefulWidget {
  const RecoverPasswordViewController({super.key});

  @override
  State<RecoverPasswordViewController> createState() => _RecoverPasswordViewControllerState();
}

class _RecoverPasswordViewControllerState extends State<RecoverPasswordViewController> {
  final viewModel = ServiceLocator.get<RecoverPasswordProtocol>();

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  Widget build(BuildContext context) {
    return RecoverPasswordView(viewModel: viewModel);
  }

  void _bind() {
    viewModel.onTapBack = () {
      // TODO: Implementar callback
      print('didTapBack');
    };

    viewModel.onSuccessRecoverPassword = () {
      // TODO: Implementar callback
      print('onSuccessRecoverPassword');
    };

    viewModel.onFailureRecoverPassword = (errorMessage) {
      // TODO: Implementar callback
      print('onFailureRecoverPassword');
    };
  }
}
