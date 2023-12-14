import '../../../support/utils/service_locator/app_module.dart';
import '../../../support/utils/service_locator/service_locator.dart';
import '../{{name.snakeCase()}}_view_controller.dart';
import '../{{name.snakeCase()}}_view_model.dart';

class {{name.pascalCase()}}Module extends AppModule {
  @override
  void registerDependencies() {
    ServiceLocator.registerFactory<{{name.pascalCase()}}Protocol>(() {
      return {{name.pascalCase()}}ViewModel();
    });
  }
}
