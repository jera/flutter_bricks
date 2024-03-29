import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

abstract class WebViewComponentViewModelProtocol with ChangeNotifier {
  bool get isWebViewLoading;
  WebViewController get webViewController;
}

class WebViewComponentView extends StatelessWidget {
  final WebViewComponentViewModelProtocol viewModel;

  const WebViewComponentView({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedBuilder(
          animation: viewModel,
          builder: _getWebViewWidget,
        ),
      ),
    );
  }

  Widget _getWebViewWidget(BuildContext context, Widget? child) {
    //TODO implemente seu widget de loading
    if (viewModel.isWebViewLoading) return Center(child: CircularProgressIndicator());
    return WebViewWidget(controller: viewModel.webViewController);
  }
}
