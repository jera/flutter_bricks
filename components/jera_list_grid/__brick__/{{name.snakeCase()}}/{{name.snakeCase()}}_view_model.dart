import 'components/{{name.snakeCase()}}_item_view.dart';
import 'components/{{name.snakeCase()}}_item_view_model.dart';
import '{{name.snakeCase()}}_view.dart';

class {{name.pascalCase()}}ViewModel extends {{name.pascalCase()}}ViewModelProtocol implements {{name.pascalCase()}}ItemDelegate {
  //Essa é a lista usada para construir cada item da grid 
  final _fruits = [
    'Maçã',
    'Banana',
    'Laranja',
    'Morango',
    'Abacaxi',
    'Uva',
    'Melancia',
    'Pêssego',
    'Manga',
    'Kiwi',
    'Cereja',
    'Pera',
    'Abacate',
    'Limão',
    'Framboesa',
    'Goiaba',
    'Caju',
    'Amora',
    'Pitaya',
    'Grapes',
    'Pêssego',
    'Melão',
    'Ameixa',
    'Maracujá',
    'Caqui',
  ];

  @override
  void didTapItem(String dataTitle) {
    //TODO:Faça as ações do botão aqui
  }

  @override
  List<{{name.pascalCase()}}ItemViewModelProtocol> get itemViewModels {
    return _fruits.map((fruit) {
      return {{name.pascalCase()}}ItemViewModel(dataTitle: fruit, delegate: this);
    }).toList();
  }
}
