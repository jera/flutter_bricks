import 'package:flutter/material.dart';

import '../domain/user_routes.dart';
import '../login/login_view_controller.dart';
import '../login/login_view_model.dart';
import '../login/use_cases/login_use_case.dart';
import '../register/register_view_controller.dart';
import '../register/register_view_model.dart';
import '../register/use_cases/register_use_case.dart';{{#has_apple}}
import '../social_use_cases/enter_with_apple_use_case.dart';{{/has_apple}}{{#has_facebook}}
import '../social_use_cases/enter_with_facebook_use_case.dart';{{/has_facebook}}{{#has_google}}
import '../social_use_cases/enter_with_google_use_case.dart';{{/has_google}}
import '../utils/session_manager.dart';{{#has_social}}
import '../utils/social_login_helper.dart';{{/has_social}}

class AuthFactory {
  static const String loginRoute = '/auth/login';
  static const String registerRoute = '/auth/register';

  static StatefulWidget login() {
    final routes = UserRoutes();
    final sessionManager = SessionManager.instance;
    final loginUseCase = LoginUseCase(routes: routes);{{#has_social}}
    final socialLoginHelper = SocialLoginHelper();{{/has_social}}{{#has_google}}
    final enterWithGoogleUseCase = EnterWithGoogleUseCase(routes: routes);{{/has_google}}{{#has_apple}}
    final enterWithAppleUseCase = EnterWithAppleUseCase(routes: routes);{{/has_apple}}{{#has_facebook}}
    final enterWithFacebookUseCase = EnterWithFacebookUseCase(routes: routes);{{/has_facebook}}
   
    final viewModel = LoginViewModel(
      loginUseCase: loginUseCase,
      sessionManager: sessionManager,{{#has_social}}
      socialLoginHelper: socialLoginHelper,{{/has_social}}{{#has_google}}
      enterWithGoogleUseCase: enterWithGoogleUseCase,{{/has_google}}{{#has_apple}}
      enterWithAppleUseCase: enterWithAppleUseCase,{{/has_apple}}{{#has_facebook}}
      enterWithFacebookUseCase: enterWithFacebookUseCase,{{/has_facebook}} 
    );
    return LoginViewController(viewModel: viewModel);
  }

  static StatefulWidget register() {
    final routes = UserRoutes();
    final sessionManager = SessionManager.instance;
    final registerUseCase = RegisterUseCase(routes: routes);{{#has_social}}
    final socialLoginHelper = SocialLoginHelper();{{/has_social}}{{#has_google}}
    final enterWithGoogleUseCase = EnterWithGoogleUseCase(routes: routes);{{/has_google}}{{#has_apple}}
    final enterWithAppleUseCase = EnterWithAppleUseCase(routes: routes);{{/has_apple}}{{#has_facebook}}
    final enterWithFacebookUseCase = EnterWithFacebookUseCase(routes: routes);{{/has_facebook}}
    
    final viewModel = RegisterViewModel(
      registerUseCase: registerUseCase,
      sessionManager: sessionManager,{{#has_social}}
      socialLoginHelper: socialLoginHelper,{{/has_social}}{{#has_google}}
      enterWithGoogleUseCase: enterWithGoogleUseCase,{{/has_google}}{{#has_apple}}
      enterWithAppleUseCase: enterWithAppleUseCase,{{/has_apple}}{{#has_facebook}}
      enterWithFacebookUseCase: enterWithFacebookUseCase,{{/has_facebook}} 
    );
    return RegisterViewController(viewModel: viewModel);
  }
}
