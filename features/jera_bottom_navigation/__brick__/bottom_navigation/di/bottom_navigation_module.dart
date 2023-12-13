import '../bottom_navigation_view_controller.dart';
import '../bottom_navigation_view_model.dart';
import '../../../support/utils/service_locator/app_module.dart';
import '../../../support/utils/service_locator/service_locator_provider.dart';

class BottomNavigationModule extends AppModule {
  @override
  void registerDependencies() {
    ServiceLocator.registerFactory<BottomNavigationViewProtocol>(() {
      return BottomNavigationViewModel();
    });
  }
}
