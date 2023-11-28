import '../models/google_login_request.dart';
import '../models/user.dart';
import '../models/user_request_ios.dart';
import '../social_use_cases/login_apple_use_case.dart';
import '../social_use_cases/login_facebook_use_case.dart';
import '../social_use_cases/login_google_use_case.dart';
import '../utils/session_manager.dart';
import '../utils/social_login_helper.dart';
import 'login_view.dart';
import 'use_cases/login_use_case.dart';

class LoginViewModel extends LoginViewModelProtocol {
  /// Private properties
  String? _email;
  String? _password;
  bool _isLoading = false;
  bool _isObscurePassword = false;

  final LoginUseCaseProtocol loginUseCase;
  final SessionManagerProtocol sessionManager;
  final SocialLoginHelperProtocol socialLoginHelper;{{#has_apple}}
  final LoginAppleUseCaseProtocol loginAppleUseCase;{{/has_apple}}{{#has_google}}
  final LoginGoogleUseCaseProtocol loginGoogleUseCase;{{/has_google}}{{#has_facebook}}
  final LoginFacebookUseCaseProtocol loginFacebookUseCase;{{/has_facebook}}

  LoginViewModel({
    required this.loginUseCase,
    required this.sessionManager,
    required this.socialLoginHelper,{{#has_apple}}
    required this.loginAppleUseCase,{{/has_apple}}{{#has_google}}
    required this.loginGoogleUseCase,{{/has_google}}{{#has_facebook}}
    required this.loginFacebookUseCase,{{/has_facebook}}
  });

  /// LoginProtocol
  @override
  bool get isLoading => _isLoading;

  @override
  bool get isEnableSubmit => _isFormValid && !_isLoading;

  @override
  bool get isObscurePassword => _isObscurePassword;

  @override
  void updateEmail(String email) {
    _email = email;
    notifyListeners();
  }

  @override
  void updatePassword(String password) {
    _password = password;
    notifyListeners();
  }

  @override
  void didTapGoToRegister() {
    onGoToRegister?.call();
  }

  @override
  void didTapShowPassword() {
    _isObscurePassword = !_isObscurePassword;
    notifyListeners();
  }

  @override
  void didTapLogin() {
    _setLoading(true);

    final email = _email ?? '';
    final password = _password ?? '';

    loginUseCase.execute(
      email: email,
      password: password,
      success: (user) {
        _setLoading(false);
        onSuccessLogin?.call();
      },
      failure: (error) {
        _setLoading(false);
        onFailureLogin?.call(error);
      },
    );
  }
  {{#has_apple}}
  @override
  void didTapLoginWithApple() {
    _setLoading(true);
    socialLoginHelper.enterWithApple(
      onFailed: (errorMessage) {
        onFailureLogin?.call(errorMessage);
        _setLoading(false);
      },
      onCanceled: () {
        onCanceledLogin?.call();
        _setLoading(false);
      },
      onSucceeded: _loginWithApple,
    );
  }{{/has_apple}}{{#has_google}}

  @override
  void didTapLoginWithGoogle() {
    _setLoading(true);
    socialLoginHelper.enterWithGoogle(
      onFailed: (errorMessage) {
        onFailureLogin?.call(errorMessage);
        _setLoading(false);
      },
      onCanceled: () {
        onCanceledLogin?.call();
        _setLoading(false);
      },
      onSucceeded: _loginWithGoogle,
    );
  }{{/has_google}}{{#has_facebook}}

  @override
  void didTapLoginWithFacebook() {
    _setLoading(true);
    socialLoginHelper.enterWithFacebook(
      onFailed: (errorMessage) {
        onFailureLogin?.call(errorMessage);
        _setLoading(false);
      },
      onCanceled: () {
        onCanceledLogin?.call();
        _setLoading(false);
      },
      onSucceeded: _loginWithFacebook,
    );
  }{{/has_facebook}}{{#has_apple}}

  void _loginWithApple(UserRequestIOS session) {
    loginAppleUseCase.execute(
      session: session,
      success: (user) {
        _createSession(user);
        onSuccessLogin?.call();
      },
      failure: (error) {
        onFailureLogin?.call(error);
        _setLoading(false);
      },
    );
  }{{/has_apple}}{{#has_facebook}}

  void _loginWithFacebook(String token) {
    loginFacebookUseCase.execute(
      token: token,
      success: (user) {
        _createSession(user);
        onSuccessLogin?.call();
      },
      failure: (error) {
        onFailureLogin?.call(error);
        _setLoading(false);
      },
    );
  }{{/has_facebook}}{{#has_google}}

  void _loginWithGoogle(GoogleLoginRequest googleLogin) {
    loginGoogleUseCase.execute(
      googleLoginRequest: googleLogin,
      success: (user) {
        _createSession(user);
        onSuccessLogin?.call();
      },
      failure: (error) {
        onFailureLogin?.call(error);
        _setLoading(false);
      },
    );
  }{{/has_google}}

  void _createSession(User user) {
    sessionManager.createSession(user).whenComplete(() {
      _setLoading(false);
    });
  }

  /// Validations
  bool get _isFormValid {
    return (_email ?? '').isNotEmpty && (_password ?? '').isNotEmpty;
  }

  /// Loading
  void _setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
