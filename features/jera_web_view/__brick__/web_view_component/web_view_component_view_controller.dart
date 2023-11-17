import 'package:flutter/material.dart';

import '../../support/utils/service_locator/service_locator_provider.dart';
import 'web_view_component_view.dart';

abstract class WebViewComponentProtocol extends WebViewComponentViewModelProtocol {
  void setupWebView();
  Future<bool> onWillPop();
}

class WebViewComponentViewController extends StatefulWidget {
  final String webViewUrl;

  const WebViewComponentViewController({super.key, required this.webViewUrl});

  @override
  State<WebViewComponentViewController> createState() => _WebViewComponentViewControllerState();
}

class _WebViewComponentViewControllerState extends State<WebViewComponentViewController> {
  late final WebViewComponentProtocol viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ServiceLocator.get<WebViewComponentProtocol>(param: widget.webViewUrl);
    viewModel.setupWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: viewModel.onWillPop,
      child: WebViewComponentView(viewModel: viewModel),
    );
  }
}
