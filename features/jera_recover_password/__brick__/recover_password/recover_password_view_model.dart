import 'recover_password_view_controller.dart';
import 'use_cases/recover_password_use_case.dart';

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
  bool get canSubmit => _email.isNotEmpty; // TODO: Validar o campo se necessário

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
    onRemoveFocus?.call();
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

  @override
  void removeFocus() {
    onRemoveFocus?.call();
  }

  /// Private Methods

  void _setLoading(bool loadingStatus) {
    _isLoading = loadingStatus;
    notifyListeners();
  }
}
