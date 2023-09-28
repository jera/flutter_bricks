import '../models/user.dart';
import '../models/user_request.dart';
import '../utils/session_manager.dart';
import 'register_view_controller.dart';
import 'use_cases/register_use_case.dart';{{#has_apple}}
import '../models/user_request_ios.dart';
import '../social_use_cases/enter_with_apple_use_case.dart';{{/has_apple}}{{#has_facebook}}
import '../social_use_cases/enter_with_facebook_use_case.dart';{{/has_facebook}}{{#has_google}}
import '../models/google_login_request.dart';
import '../social_use_cases/enter_with_google_use_case.dart';{{/has_google}}{{#has_social}}
import '../utils/social_login_helper.dart';{{/has_social}}

class RegisterViewModel extends RegisterProtocol {
  /// Private properties
  String? _name;
  String? _email;
  String? _password;
  bool _isLoading = false;

  final RegisterUseCaseProtocol registerUseCase;
  final SessionManagerProtocol sessionManager;{{#has_social}}
  final SocialLoginHelperProtocol socialLoginHelper;{{/has_social}}{{#has_apple}}
  final EnterWithAppleUseCaseProtocol enterWithAppleUseCase;{{/has_apple}}{{#has_facebook}}
  final EnterWithFacebookUseCaseProtocol enterWithFacebookUseCase;{{/has_facebook}}{{#has_google}}
  final EnterWithGoogleUseCaseProtocol enterWithGoogleUseCase;{{/has_google}}

  RegisterViewModel({
    required this.registerUseCase,
    required this.sessionManager,{{#has_social}}
    required this.socialLoginHelper,{{/has_social}}{{#has_apple}}
    required this.enterWithAppleUseCase,{{/has_apple}}{{#has_facebook}}
    required this.enterWithFacebookUseCase,{{/has_facebook}}{{#has_google}}
    required this.enterWithGoogleUseCase,{{/has_google}}
  });

  /// RegisterProtocol
  @override
  bool get isLoading => _isLoading;

  @override
  bool get isEnableSubmit => _isFormValid && !_isLoading;

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
  void updatePassword(String password) {
    _password = password;
    notifyListeners();
  }

  @override
  void didTapRegister() {
    _setLoading(true);

    final user = UserRequest(
      name: _name ?? '',
      email: _email ?? '',
      password: _password ?? '',
    );

    registerUseCase.execute(
      user: user,
      success: (user) {
        _createSession(user);
        onSuccessRegister?.call();
      },
      failure: (error) {
        _setLoading(false);
        onFailureRegister?.call(error);
      },
    );
  }{{#has_apple}}

  @override
  void didTapRegisterWithApple() {
    _setLoading(true);
    socialLoginHelper.enterWithApple(
      onFailed: (errorMessage) {
        onFailureRegister?.call(errorMessage);
        _setLoading(false);
      },
      onCanceled: () {
        onCanceledRegister?.call();
        _setLoading(false);
      },
      onSucceeded: _registerWithApple,
    );
  }

  void _registerWithApple(UserRequestIOS session) {
    enterWithAppleUseCase.execute(
      session: session,
      success: (user) {
        _createSession(user);
        onSuccessRegister?.call();
      },
      failure: (error) {
        onFailureRegister?.call(error);
        _setLoading(false);
      },
    );
  } {{/has_apple}}{{#has_facebook}}

  @override
  void didTapRegisterWithFacebook() {
    _setLoading(true);
    socialLoginHelper.enterWithFacebook(
      onFailed: (errorMessage) {
        onFailureRegister?.call(errorMessage);
        _setLoading(false);
      },
      onCanceled: () {
        onCanceledRegister?.call();
        _setLoading(false);
      },
      onSucceeded: _registerWithFacebook,
    );
  }
  
  void _registerWithFacebook(String token) {
    enterWithFacebookUseCase.execute(
      token: token,
      success: (user) {
        _createSession(user);
        onSuccessRegister?.call();
      },
      failure: (error) {
        onFailureRegister?.call(error);
        _setLoading(false);
      },
    );
  } {{/has_facebook}}{{#has_google}}

  @override
  void didTapRegisterWithGoogle() {
    _setLoading(true);
    socialLoginHelper.enterWithGoogle(
      onFailed: (errorMessage) {
        onFailureRegister?.call(errorMessage);
        _setLoading(false);
      },
      onCanceled: () {
        onCanceledRegister?.call();
        _setLoading(false);
      },
      onSucceeded: _registerWithGoogle,
    );
  }

  void _registerWithGoogle(GoogleLoginRequest googleLogin) {
    enterWithGoogleUseCase.execute(
      googleLoginRequest: googleLogin,
      success: (user) {
        _createSession(user);
        onSuccessRegister?.call();
      },
      failure: (error) {
        onFailureRegister?.call(error);
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
    return (_email ?? '').isNotEmpty && (_password ?? '').isNotEmpty && (_name ?? '').isNotEmpty;
  }

  /// Loading
  void _setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
