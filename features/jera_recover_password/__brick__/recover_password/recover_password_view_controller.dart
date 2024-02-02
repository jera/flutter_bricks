abstract class RecoverPasswordProtocol extends RecoverPasswordViewModelProtocol {
  VoidCallback? onTapBack;
  VoidCallback? onRemoveFocus;
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
    };

    viewModel.onRemoveFocus = () {
      FocusScope.of(context).unfocus();
    };

    viewModel.onSuccessRecoverPassword = () {
      // TODO: Implementar callback
    };

    viewModel.onFailureRecoverPassword = (errorMessage) {
      // TODO: Implementar callback
    };
  }
}
