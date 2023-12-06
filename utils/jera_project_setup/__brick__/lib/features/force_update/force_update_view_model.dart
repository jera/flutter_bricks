import 'dart:io';

import 'force_update_view.dart';

class ForceUpdateViewModel extends ForceUpdateViewModelProtocol {
  final bool isRequired;

  // Constructor
  ForceUpdateViewModel({
    required this.isRequired,
  });

  @override
  bool get showIgnoreButton => !isRequired;

  @override
  String get storeURL {
    if (Platform.isAndroid) return 'TODO';
    return 'TODO';
  }

  @override
  String get description {
    if (isRequired) return 'A atualização é obrigatória';
    return 'Atualize o app e aproveite as novas funcionalidades';
  }
}
