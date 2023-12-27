import '../../../support/utils/service_locator/app_module.dart';
import '../../../support/utils/service_locator/service_locator.dart';
import '../contact_us_view_controller.dart';
import '../contact_us_view_model.dart';

class ContactUsModule extends AppModule {
  @override
  void registerDependencies() {
    ServiceLocator.registerFactory<ContactUsProtocol>(() {
      return ContactUsViewModel();
    });
  }
}
