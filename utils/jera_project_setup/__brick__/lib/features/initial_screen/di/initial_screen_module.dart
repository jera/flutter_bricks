import '../../../support/utils/service_locator/app_module.dart';
import '../../../support/utils/service_locator/service_locator.dart';
import '../initial_screen_view_controller.dart';
import '../initial_screen_view_model.dart';

class InitialScreenModule extends AppModule {
  {{^with_go_router}}
  static const String initialScreenRoute = '/initial_screen_route';{{/with_go_router}}
  @override
  void registerDependencies() {
    ServiceLocator.registerFactory<InitialScreenProtocol>(() {
      return InitialScreenViewModel();
    });
  }
}
