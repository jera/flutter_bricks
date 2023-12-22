import '../../../support/utils/service_locator/app_module.dart';
import '../../../support/utils/service_locator/service_locator.dart';

import '../tab_layout_view_controller.dart';
import '../tab_layout_view_model.dart';

class TabLayoutModule extends AppModule {
  @override
  void registerDependencies() {
    ServiceLocator.registerFactory<TabLayoutProtocol>(() => TabLayoutViewModel());
  }
}
