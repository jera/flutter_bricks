import '../profile_view_model.dart';
import '../profile_view_controller.dart';
import '../../support/service_locator/app_module.dart';
import '../../support/service_locator/service_locator.dart';

class ProfileModule extends AppModule {
  @override
  void registerDependencies() {
    ServiceLocator.registerFactory<ProfileProtocol>(() {
      return ProfileViewModel();
    });
  }
}
