import 'package:flutter/material.dart';

import '../../support/service_locator/service_locator.dart';
import 'edit_profile_view.dart';

abstract class EditProfileProtocol extends EditProfileViewModelProtocol {
  VoidCallback? onTapGoBack;
  VoidCallback? onTapSettings;
}

class EditProfileViewController extends StatefulWidget {
  const EditProfileViewController({super.key});

  @override
  State<EditProfileViewController> createState() => _EditProfileViewControllerState();
}

class _EditProfileViewControllerState extends State<EditProfileViewController> {
  late EditProfileProtocol viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ServiceLocator.get<EditProfileProtocol>();
    _bind();
  }

  @override
  Widget build(BuildContext context) {
    return EditProfileView(viewModel: viewModel);
  }

  void _bind() {
    viewModel.onTapGoBack = () {
      /// TODO: implementar ontapgoback
    };

    viewModel.onTapSettings = () {
      /// TODO: implementar ontapsettings
    };
  }
}
