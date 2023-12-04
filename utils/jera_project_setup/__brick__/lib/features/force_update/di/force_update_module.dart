import '../../../support/utils/helpers/force_update.dart';
import '../../../support/utils/service_locator/app_module.dart';
import '../../../support/utils/service_locator/service_locator.dart';

import '../force_update_view.dart';
import '../force_update_view_model.dart';
import '../../../api/routes/force_update_routes.dart';
import '../../../features/force_update/use_case/get_app_info_use_case.dart';
import '../../../features/force_update/use_case/get_minimum_version_use_case.dart';

class ForceUpdateModule extends AppModule {
  {{^with_go_router}}
  static const String forceUpdateRoute = '/force_update';{{/with_go_router}}
  @override
  void registerDependencies() {
    ServiceLocator.registerFactory<ForceUpdateRoutesProtocol>(() {
      return ForceUpdateRoutes();
    });

    ServiceLocator.registerFactory<GetAppInfoUseCaseProtocol>(() {
      return GetAppInfoUseCase();
    });

    ServiceLocator.registerFactory<GetMinimumVersionUseCaseProtocol>(() {
      return GetMinimumVersionUseCase(route: ServiceLocator.get<ForceUpdateRoutesProtocol>());
    });

    ServiceLocator.registerLazySingleton<ForceUpdateProtocol>(() {
      return ForceUpdate(
        getAppInfoUseCase: ServiceLocator.get<GetAppInfoUseCaseProtocol>(),
        getMinimumVersionUseCase: ServiceLocator.get<GetMinimumVersionUseCaseProtocol>(),
       );
    });

    ServiceLocator.registerFactoryParam<ForceUpdateViewModelProtocol, bool>((isRequiredUpdate) {
      return ForceUpdateViewModel(isRequired: isRequiredUpdate);
    });
  }
}
