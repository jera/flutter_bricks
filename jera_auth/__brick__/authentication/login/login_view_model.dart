
import '../models/user.dart';
import '../utils/session_manager.dart';
import 'login_view_controller.dart';
import 'use_cases/login_use_case.dart';{{#has_apple}}
import '../models/user_request_ios.dart';
import '../social_use_cases/enter_with_apple_use_case.dart';{{/has_apple}}{{#has_facebook}}
import '../social_use_cases/enter_with_facebook_use_case.dart';{{/has_facebook}}{{#has_google}}
import '../models/google_login_request.dart';
import '../social_use_cases/enter_with_google_use_case.dart';{{/has_google}}{{#has_social}}
import '../utils/social_login_helper.dart';{{/has_social}}

class LoginViewModel extends LoginProtocol {
  /// Private properties
  String? _email;
  String? _password;
  bool _isLoading = false;

  final LoginUseCaseProtocol loginUseCase;
  final SessionManagerProtocol sessionManager;{{#has_social}}
  final SocialLoginHelperProtocol socialLoginHelper;{{/has_social}}{{#has_apple}}
  final EnterWithAppleUseCaseProtocol enterWithAppleUseCase;{{/has_apple}}{{#has_facebook}}
  final EnterWithFacebookUseCaseProtocol enterWithFacebookUseCase;{{/has_facebook}}{{#has_google}}
  final EnterWithGoogleUseCaseProtocol enterWithGoogleUseCase;{{/has_google}}

  LoginViewModel({
    required this.loginUseCase,
    required this.sessionManager,{{#has_social}}
    required this.socialLoginHelper,{{/has_social}}{{#has_apple}}
    required this.enterWithAppleUseCase,{{/has_apple}}{{#has_facebook}}
    required this.enterWithFacebookUseCase,{{/has_facebook}}{{#has_google}}
    required this.enterWithGoogleUseCase,{{/has_google}}
  });

  /// LoginProtocol
  @override
  bool get isLoading => _isLoading;

  @override
  bool get isEnableSubmit => _isFormValid && !_isLoading;

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
  } {{#has_apple}}

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
  }

   void _loginWithApple(UserRequestIOS session) {
    enterWithAppleUseCase.execute(
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
  }{{/has_apple}} {{#has_facebook}}

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
  }

   void _loginWithFacebook(String token) {
    enterWithFacebookUseCase.execute(
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
  } {{/has_facebook}}{{#has_google}}

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
  } 

  void _loginWithGoogle(GoogleLoginRequest googleLogin) {
    enterWithGoogleUseCase.execute(
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
  } {{/has_google}}

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
