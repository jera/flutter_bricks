import '../edit_profile_view_model.dart';
import '../edit_profile_view_controller.dart';
import '../../support/service_locator/app_module.dart';
import '../../support/service_locator/service_locator.dart';

class EditProfileModule extends AppModule {
  @override
  void registerDependencies() {
    ServiceLocator.registerFactory<EditProfileProtocol>(() {
      return EditProfileViewModel();
    });
  }
}
