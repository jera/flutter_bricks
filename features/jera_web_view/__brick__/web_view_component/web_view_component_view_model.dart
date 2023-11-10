import 'package:webview_flutter/webview_flutter.dart';

import 'web_view_component_view_controller.dart';

class WebViewComponentViewModel extends WebViewComponentProtocol {
  bool _isWebViewLoading = true;
  late WebViewController _webViewController;
  final String webViewUrl;

  WebViewComponentViewModel({required this.webViewUrl});

  @override
  WebViewController get webViewController => _webViewController;

  @override
  bool get isWebViewLoading => _isWebViewLoading;

  @override
  void prepareWebView() {
    _createWebViewController();
  }

  @override
  Future<bool> onWillPop() async {
    if (await webViewController.canGoBack()) {
      await webViewController.goBack();
      return false;
    }
    return true;
  }

  void _setWebViewLoading(bool isLoading) {
    _isWebViewLoading = isLoading;
    notifyListeners();
  }

  Future<void> _createWebViewController() async {
    _setWebViewLoading(true);
    _webViewController = WebViewController();
    await _webViewController.setJavaScriptMode(JavaScriptMode.unrestricted);
    await _webViewController.loadRequest(Uri.parse(webViewUrl));
    await _webViewController.setNavigationDelegate(
      NavigationDelegate(
        onPageFinished: (_) async {},
        onProgress: (currentProgress) {
          final isLoadingInProgress = currentProgress < 100;
          _setWebViewLoading(isLoadingInProgress);
        },
      ),
    );
  }
}
