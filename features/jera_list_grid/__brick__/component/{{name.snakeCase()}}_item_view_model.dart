import '{{name.snakeCase()}}_item_view.dart';

abstract class {{name.snakeCase()}}ItemDelegate {
  void didTapItem(String dataTitle);
}

class {{name.snakeCase()}}ItemViewModel extends{{name.snakeCase()}}ItemViewModelProtocol {
  final String dataTitle;
  final {{name.snakeCase()}}ItemDelegate delegate;

  {{name.snakeCase()}}ItemViewModel({required this.dataTitle, required this.delegate});

  @override
  String get title => dataTitle;

  @override
  void didTapItem() {
    delegate.didTapItem(dataTitle);
  }
}
