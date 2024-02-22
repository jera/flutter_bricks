import '../{{name.snakeCase()}}_view_model.dart';

class {{name.pascalCase()}}Module extends AppModule {

  @override
  void registerDependencies() {
    ServiceLocator.registerFactory<{{name.pascalCase()}}Protocol>(() {
      return {{name.pascalCase()}}ViewModel();
    });
  }
}
