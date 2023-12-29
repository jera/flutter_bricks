import 'package:flutter/material.dart';

import '../../support/utils/service_locator/service_locator.dart';
import 'tab_layout_view.dart';

abstract class TabLayoutProtocol extends TabLayoutViewModelProtocol {}

class TabLayoutViewController extends StatefulWidget {
  const TabLayoutViewController({super.key});

  @override
  State<TabLayoutViewController> createState() => _TabLayoutViewControllerState();
}

class _TabLayoutViewControllerState extends State<TabLayoutViewController> {
  final viewModel = ServiceLocator.get<TabLayoutProtocol>();

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  Widget build(BuildContext context) {
    return TabLayoutView(viewModel: viewModel);
  }

  void _bind() {}
}
