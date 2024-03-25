import 'edit_profile_view_controller.dart';

class EditProfileViewModel extends EditProfileProtocol {
  bool _isLoading = false;
  bool _hasError = false;
  bool _hasChanges = false;

  String? _newName;
  String? _newEmail;

  final String _userName = 'Nome';
  final String _userEmail = 'email@jera.com.br';

  @override
  String get email => _userEmail;

  @override
  String get name => _userName;

  @override
  String get avatarUrl => '';

  @override
  bool get canSubmit => _hasChanges && !_hasError;

  @override
  void updateEmail(String text) {
    _newEmail = text;
    _checkChanges();
    _notify();
  }

  @override
  void updateName(String text) {
    _newName = text;
    _checkChanges();
    _notify();
  }

  @override
  String? emailValidator() {
    final emailFormat = RegExp(r'[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,64}');

    final isEmailEmpty = _newEmail?.trim().isEmpty ?? true;
    final isEmailValid = emailFormat.hasMatch(_newEmail ?? '');

    if (isEmailEmpty) {
      _hasError = true;
      _notify();
      return 'Email não pode estar vazio';
    }

    if (!isEmailValid) {
      _hasError = true;
      _notify();
      return 'Email inválido';
    }

    _hasError = false;
    _notify();
    return null;
  }

  @override
  String? nameValidator() {
    final isNameEmpty = _newName?.trim().isEmpty ?? true;

    if (isNameEmpty) {
      _hasError = true;
      _notify();
      return 'Nome não pode estar vazio';
    }

    _hasError = false;
    _notify();
    return null;
  }

  @override
  void didTapEditAvatar() {
    // TODO: Implementar alteração do avatar do usuário
  }

  @override
  void didTapSaveData() {
    if (_isLoading) return;

    _setLoading(true);
    // TODO: Implementar submit dos novos dados
  }

  @override
  void didTapGoBack() {
    onTapGoBack?.call();
  }

  @override
  void didTapSettings() {
    onTapSettings?.call();
  }

  void _checkChanges() {
    if (_newEmail == null && _newName == null) {
      _hasChanges = false;
      return;
    }

    final hasChangedName = _newName?.trim() != _userName;
    final hasChangedEmail = _newEmail?.trim() != _userEmail;

    if (_newName != null && hasChangedName) {
      _hasChanges = true;
      return;
    }

    if (_newEmail != null && hasChangedEmail) {
      _hasChanges = true;
      return;
    }

    _hasChanges = false;
  }

  void _setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void _notify() {
    Future.microtask(() => notifyListeners());
  }
}
