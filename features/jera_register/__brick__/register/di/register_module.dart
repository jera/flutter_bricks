import '../../../../support/utils/service_locator/app_module.dart';
import '../../../../support/utils/service_locator/service_locator.dart';
import '../domain/register_routes.dart';
import '../register_view.dart';
import '../register_view_model.dart';
import '../use_cases/register_use_case.dart';

class RegisterModule extends AppModule {
  @override
  void registerDependencies() {
    ServiceLocator.registerFactory<RegisterRoutesProtocol>(() {
      return RegisterRoutes();
    });

    ServiceLocator.registerFactory<RegisterUseCaseProtocol>(() {
      return RegisterUseCase(routes: ServiceLocator.get<RegisterRoutesProtocol>());
    });

    ServiceLocator.registerFactory<RegisterViewModelProtocol>(() {
      return RegisterViewModel(
        sessionManager: ServiceLocator.get(),
        registerUseCase: ServiceLocator.get(),
      );
    });
  }
}
