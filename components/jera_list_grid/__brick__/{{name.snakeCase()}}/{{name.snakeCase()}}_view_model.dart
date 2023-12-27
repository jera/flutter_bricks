import 'components/{{name.snakeCase()}}_item_view.dart';
import 'components/{{name.snakeCase()}}_item_view_model.dart';
import '{{name.snakeCase()}}_view.dart';

class {{name.pascalCase()}}ViewModel extends {{name.pascalCase()}}ViewModelProtocol implements {{name.pascalCase()}}ItemDelegate {
  //This is the list used to construct the items
  final _frutas = [
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
    //do the button actions here
  }

  @override
  List<{{name.pascalCase()}}ItemViewModelProtocol> get itemViewModels {
    return _frutas.map((fruta) {
      return {{name.pascalCase()}}ItemViewModel(dataTitle: fruta, delegate: this);
    }).toList();
  }
}
