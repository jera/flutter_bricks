import 'component/{{name.snakeCase()}}_item.dart';
import 'component/{{name.snakeCase()}}_item_view_model.dart';
import '{{name.snakeCase()}}_view_controller.dart';

class {{name.pascalCase()}}ViewModel extends {{name.pascalCase()}}Protocol implements {{name.pascalCase()}}ItemDelegate {
  bool _isEmpty = false;
  bool _idLoading = false;
  
  // TODO: Essa é a lista que contém os dados que irá construir o seu componente
  final _data = [
    'peruca',
    'alteza',
    'apaziguar',
    'socorrido',
    'lavado',
    'revista',
    'silenciar',
    'desembolso',
    'rudemente',
    'facilitado',
    'libra',
    'segue',
    'inter-relacionamento',
    'grifar',
    'onze',
  ];

  // Protocol methods
  @override
  List<{{name.pascalCase()}}ItemViewModelProtocol> get itemViewModels {
    return _data.map((data) {
      return {{name.pascalCase()}}ItemViewModel(
        dataTitle: data,
        delegate: this,
      );
    }).toList();
  }

  // TODO: implementar a lógica para controlar os feedbacks de loading e vazio
  @override
  bool get isLoading => _idLoading;

  @override
  bool get isEmpty => _isEmpty;

  // Delegate methods
  @override
  void onTap(String dataTitle) {
    navigateToDetails?.call(dataTitle);
  }
}
