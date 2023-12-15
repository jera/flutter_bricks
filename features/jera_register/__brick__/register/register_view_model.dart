import '../models/user.dart';
import '../utils/session_manager.dart';
import 'models/register_request.dart';
import 'register_view.dart';
import 'support/extensions/string_validations.dart';
import 'use_cases/register_use_case.dart';

class RegisterViewModel extends RegisterViewModelProtocol {
  String _name = '';
  String _email = '';
  String _phone = '';
  String _document = '';
  String _password = '';
  String _confirmPassword = '';
  String? _nameErrorText;
  String? _emailErrorText;
  String? _phoneErrorText;
  String? _documentErrorText;
  String? _passwordErrorText;
  String? _confirmPasswordErrorText;
  bool _isLoading = false;
  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;

  final SessionManagerProtocol sessionManager;
  final RegisterUseCaseProtocol registerUseCase;

  RegisterViewModel({
    required this.sessionManager,
    required this.registerUseCase,
  });

  @override
  bool get isLoading => _isLoading;

  @override
  bool get isObscurePassword => _isObscurePassword;

  @override
  bool get isObscureConfirmPassword => _isObscureConfirmPassword;

  @override
  String? get nameErrorText => _nameErrorText;

  @override
  String? get emailErrorText => _emailErrorText;

  @override
  String? get phoneErrorText => _phoneErrorText;

  @override
  String? get documentErrorText => _documentErrorText;

  @override
  String? get passwordErrorText => _passwordErrorText;

  @override
  String? get confirmPasswordErrorText => _confirmPasswordErrorText;

  @override
  void updateName(String name) {
    _name = name;
    notifyListeners();
  }

  @override
  void updateEmail(String email) {
    _email = email;
    notifyListeners();
  }

  @override
  void updatePhone(String phone) {
    _phone = phone;
    notifyListeners();
  }

  @override
  void updateDocument(String document) {
    _document = document;
    notifyListeners();
  }

  @override
  void updatePassword(String password) {
    _password = password;
    notifyListeners();
  }

  @override
  void updateConfirmPassword(String confirmPassword) {
    _confirmPassword = confirmPassword;
    notifyListeners();
  }

  @override
  void didTapFormValidator() {
    _validateName();
    _validateEmail();
    _validatePhone();
    _validateDocument();
    _validatePassword();
    _validateConfirmPassword();
    if (_passwordErrorText == null &&
        _confirmPasswordErrorText == null &&
        _nameErrorText == null &&
        _phoneErrorText == null &&
        _documentErrorText == null &&
        _emailErrorText == null) {
      _didTapRegister();
    }
    notifyListeners();
  }

  void _didTapRegister() {
    _setLoading(true);

    final register = RegisterRequest(
      name: _name,
      email: _email,
      phone: _phone,
      document: _document,
      password: _password,
      confirmPassword: _confirmPassword,
    );

    registerUseCase.execute(
      register: register,
      success: (user) {
        _createSession(user);
        onSuccessRegister?.call();
      },
      failure: (error) {
        _setLoading(false);
        onFailureRegister?.call(error);
      },
    );
  }

  @override
  void didTapShowPassword() {
    _isObscurePassword = !_isObscurePassword;
    notifyListeners();
  }

  @override
  void didTapShowConfirmPassword() {
    _isObscureConfirmPassword = !_isObscureConfirmPassword;
    notifyListeners();
  }

  void _createSession(User user) {
    sessionManager.createSession(user).whenComplete(() {
      _setLoading(false);
    });
  }

  void _validateName() {
    final nameSplit = _name.trim().split(' ');

    if (_name.isEmpty || nameSplit.length <= 1) {
      _nameErrorText = 'Digite seu nome completo';
    } else {
      _nameErrorText = null;
    }
  }

  void _validateEmail() {
    if (_email.isEmpty) {
      _emailErrorText = 'Insira um email';
    } else {
      _emailErrorText = !_email.isEmail() ? 'Endereço de e-mail inválido' : null;
    }
  }

  void _validatePhone() {
    if (_phone.length < 16 || _phone.isEmpty) {
      _phoneErrorText = 'Insira seu celular';
    } else {
      _phoneErrorText = null;
    }
  }

  void _validateDocument() {
    if (_document.trim().isEmpty) _documentErrorText = 'Digite seu CPF';
    if (!_document.isDocument()) _documentErrorText = 'Digite um CPF valido';
  }

  void _validatePassword() {
    _passwordErrorText = _password.trim().isEmpty ? 'Insira uma senha' : null;
  }

  void _validateConfirmPassword() {
    if (_password != _confirmPassword) {
      _confirmPasswordErrorText = 'As senhas não são iguais';
    } else {
      _confirmPasswordErrorText = _confirmPassword.trim().isEmpty ? 'Insira uma senha' : null;
    }
  }

  /// Loading
  void _setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
