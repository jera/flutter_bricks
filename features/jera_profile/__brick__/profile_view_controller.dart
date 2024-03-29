import 'package:flutter/material.dart';

import '../../support/service_locator/service_locator.dart';
import 'profile_view.dart';

abstract class ProfileProtocol extends ProfileViewModelProtocol {
  VoidCallback? onTapBack;
  VoidCallback? onTapEditProfile;
}

class ProfileViewController extends StatefulWidget {
  const ProfileViewController({super.key});

  @override
  State<ProfileViewController> createState() => _ProfileViewControllerState();
}

class _ProfileViewControllerState extends State<ProfileViewController> {
  final viewModel = ServiceLocator.get<ProfileProtocol>();

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileView(viewModel: viewModel);
  }

  void _bind() {
    viewModel.onTapBack = () {
      /// TODO: implementar onTapBack
    };

    viewModel.onTapEditProfile = () {
      /// TODO: implementar onTapEditProfile
    };
  }
}
