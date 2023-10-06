import '../../../support/utils/service_locator/app_module.dart';
import '../../../support/utils/service_locator/service_locator.dart';

import '../force_update_view.dart';
import '../force_update_view_model.dart';

class ForceUpdateModule extends AppModule {
  {{^with_go_router}}
  static const String forceUpdateRoute = '/force_update';{{/with_go_router}}
  @override
  void registerDependencies() {
    ServiceLocator.registerFactoryParam<ForceUpdateViewModelProtocol, bool>((isRequiredUpdate) {
      return ForceUpdateViewModel(isRequired: isRequiredUpdate);
    });
  }
}
