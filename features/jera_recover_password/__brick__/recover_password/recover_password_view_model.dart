class RecoverPasswordViewModel extends RecoverPasswordProtocol {
  /// Private Variables

  String _email = '';
  bool _isLoading = false;

  /// Init

  final RecoverPasswordUseCaseProtocol recoverPasswordUseCase;

  RecoverPasswordViewModel({required this.recoverPasswordUseCase});

  /// Public Getters

  @override
  bool get isLoading => _isLoading;

  @override
  bool get canSubmit => _email.isNotEmpty;

  // TODO: Verificar necessidade do validator
  // @override
  // String? emailValidator(String? email) {
  //   if (email?.isEmpty ?? true) return 'Email';

  //   if (!RegExp('[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}').hasMatch(_email ?? '')) return 'Email inválido';

  //   return null;
  // }

  /// Public Methods

  @override
  void didTapBack() {
    onTapBack?.call();
  }

  @override
  void updateEmail(String email) {
    _email = email;
    notifyListeners();
  }

  @override
  void didTapRecoverPassword() {
    recoverPasswordUseCase.execute(
      success: () {
        onSuccessRecoverPassword?.call();
      },
      failure: (error) {
        onFailureRecoverPassword?.call(error);
      },
      onComplete: () => _setLoading(false),
    );
  }

  /// Private Methods

  void _setLoading(bool loadingStatus) {
    _isLoading = loadingStatus;
    notifyListeners();
  }
}
