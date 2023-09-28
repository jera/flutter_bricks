import 'package:flutter/material.dart';

import '../force_update_view.dart';
import '../force_update_view_model.dart';

class ForceUpdateFactory {
  static const String forceUpdateRoute = '/force_update';

  static StatefulWidget forceUpdate({required bool isRequired}) {
    final viewModel = ForceUpdateViewModel(isRequired: isRequired);
    return ForceUpdateView(viewModel: viewModel);
  }
}
