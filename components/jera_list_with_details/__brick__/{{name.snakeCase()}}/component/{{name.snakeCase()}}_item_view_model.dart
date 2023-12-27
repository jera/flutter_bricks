import '{{name.snakeCase()}}_item.dart';

abstract class {{name.pascalCase()}}ItemDelegate {
  void onTap(String dataTitle);
}

class {{name.pascalCase()}}ItemViewModel extends {{name.pascalCase()}}ItemViewModelProtocol {
  final String dataTitle;
  final {{name.pascalCase()}}ItemDelegate delegate;

  {{name.pascalCase()}}ItemViewModel({
    required this.dataTitle,
    required this.delegate,
  });

  @override
  void onTap() {
    delegate.onTap(dataTitle);
  }

  @override
  String get title => dataTitle;
}
