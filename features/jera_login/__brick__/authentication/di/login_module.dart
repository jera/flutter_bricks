import '../../../support/utils/service_locator/app_module.dart';
import '../../../support/utils/service_locator/service_locator.dart';
import '../login/login_view.dart';
import '../login/login_view_model.dart';
import '../login/use_cases/login_use_case.dart';{{#has_apple}}
import '../social_use_cases/login_apple_use_case.dart';{{/has_apple}}{{#has_facebook}}
import '../social_use_cases/login_facebook_use_case.dart';{{/has_facebook}}{{#has_google}}
import '../social_use_cases/login_google_use_case.dart';{{/has_google}}

class LoginModule extends AppModule {
  @override
  void registerDependencies() {
    ServiceLocator.registerFactory<LoginUseCaseProtocol>(() {
      return LoginUseCase(routes: ServiceLocator.get());
    });
    {{#has_apple}}
    ServiceLocator.registerFactory<LoginAppleUseCaseProtocol>(() {
      return LoginAppleUseCase(routes: ServiceLocator.get());
    });{{/has_apple}}
    
    ServiceLocator.registerFactory<LoginFacebookUseCaseProtocol>(() {
      return LoginFacebookUseCase(routes: ServiceLocator.get());
    });

    ServiceLocator.registerFactory<LoginGoogleUseCaseProtocol>(() {
      return LoginGoogleUseCase(routes: ServiceLocator.get());
    });

    ServiceLocator.registerFactory<LoginViewModelProtocol>(() {
      return LoginViewModel(
        loginUseCase: ServiceLocator.get(),
        sessionManager: ServiceLocator.get(),
        socialLoginHelper: ServiceLocator.get(),
        loginAppleUseCase: ServiceLocator.get(),
        loginGoogleUseCase: ServiceLocator.get(),
        loginFacebookUseCase: ServiceLocator.get(),
      );
    });
  }
}
