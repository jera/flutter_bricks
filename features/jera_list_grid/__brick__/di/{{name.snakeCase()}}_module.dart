import '../../../support/utils/service_locator/app_module.dart';
import '../../../support/utils/service_locator/service_locator.dart';
import '../{{name.snakeCase()}}_route_view.dart';
import '../{{name.snakeCase()}}_route_view_model.dart';

class {{name.pascalCase()}}Module extends AppModule {
  static const String route = '/{{name.snakeCase()}}_route';

  @override
  void registerDependencies() {
    ServiceLocator.registerFactory<{{name.pascalCase()}}ViewModelProtocol>(() {
      return {{name.pascalCase()}}ViewModel();
    });
  }
}
