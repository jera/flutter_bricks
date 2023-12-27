import '{{name.snakeCase()}}_item_view.dart';

abstract class {{name.pascalCase()}}ItemDelegate {
  void didTapItem(String dataTitle);
}

class {{name.pascalCase()}}ItemViewModel extends {{name.pascalCase()}}ItemViewModelProtocol {
  final String dataTitle;
  final {{name.pascalCase()}}ItemDelegate delegate;

  {{name.pascalCase()}}ItemViewModel({required this.dataTitle, required this.delegate});

  @override
  String get title => dataTitle;

  @override
  void didTapItem() {
    delegate.didTapItem(dataTitle);
  }
}
