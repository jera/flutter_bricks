import 'edit_profile_view_controller.dart';

class EditProfileViewModel extends EditProfileProtocol {
  bool _hasChanges = false;
  String? _newName;
  String? _newEmail;
  String _errorMessage = '';

  final String _userName = 'Nome';
  final String _userEmail = 'email@jera.com.br';

  @override
  String get email => _userEmail;

  @override
  String get name => _userName;

  @override
  String get avatarUrl => '';

  @override
  void didTapEditAvatar() {
    // TODO: implement didTapEditAvatar
  }

  @override
  void didTapSaveData() {
    // TODO: implement didTapSaveData
  }

  @override
  void updateEmail(String text) {
    _newEmail = text;
    _validateEmail();
  }

  @override
  void updateName(String text) {
    _newName = text;
    _validateName();
  }

  @override
  void didTapGoBack() {
    onTapGoBack?.call();
  }

  @override
  void didTapSettings() {
    onTapSettings?.call();
  }

  void _validateName() {
    final isNameEmpty = _newName?.trim().isEmpty ?? true;

    _errorMessage = isNameEmpty ? 'Nome não pode estar vazio' : '';

    _checkChanges();
  }

  void _validateEmail() {
    const emailFormat = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    final isEmailEmpty = _newEmail?.trim().isEmpty ?? true;
    final isEmailValid = emailFormat.hasMatch(_newEmail ?? '');

    if (isEmailEmpty) {
      _errorMessage = 'Email não pode estar vazio';
      return;
    }

    if (!isEmailValid) {
      _errorMessage = 'Email inválido';
      return;
    }

    _checkChanges();
  }

  void _checkChanges() {
    final hasChangedName = _newName?.trim() != _userName;
    final hasChangedEmail = _newEmail?.trim() != _userEmail;

    _hasChanges = hasChangedEmail || hasChangedName;

    notifyListeners();
  }
}
