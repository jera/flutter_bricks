import '../../support/utils/service_locator/service_locator_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'bottom_navigation_view.dart';

abstract class BottomNavigationViewProtocol extends BottomNavigationViewModelProtocol {
  void Function(int index)? onTapBottomNavigationItem;
}

class BottomNavigationViewController extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const BottomNavigationViewController({super.key, required this.navigationShell});

  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationViewControllerState();
  }
}

class _BottomNavigationViewControllerState extends State<BottomNavigationViewController> {
  final viewModel = ServiceLocator.get<BottomNavigationViewProtocol>();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationView(
      viewModel: viewModel,
      navigationShell: widget.navigationShell,
    );
  }

  void _bind() {
    viewModel.onTapBottomNavigationItem = (index) {
      widget.navigationShell.goBranch(
        index,
        initialLocation: index == widget.navigationShell.currentIndex,
      );
    };
  }
}
