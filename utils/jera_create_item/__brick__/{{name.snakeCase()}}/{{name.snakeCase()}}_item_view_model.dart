import '{{name.snakeCase()}}_item_view.dart';
{{#has_delegate}}
abstract class {{name.pascalCase()}}ItemViewModelDelegate {}{{/has_delegate}}

class {{name.pascalCase()}}ItemViewModel extends {{name.pascalCase()}}ItemViewModelProtocol {
  //TODO passar seu modelo
  final Object object;
  {{#has_delegate}}final {{name.pascalCase()}}ItemViewModelDelegate delegate;{{/has_delegate}}

  {{name.pascalCase()}}ItemViewModel({required this.object{{#has_delegate}}, required this.delegate, {{/has_delegate}}});
}
