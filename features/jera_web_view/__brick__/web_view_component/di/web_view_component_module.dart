import '../../../support/utils/service_locator/app_module.dart';
import '../../../support/utils/service_locator/service_locator_provider.dart';
import '../web_view_component_view_controller.dart';
import '../web_view_component_view_model.dart';

class WebViewComponentModule extends AppModule {
  static const String webViewComponentRoute = 'web_view_component';

  @override
  void registerDependencies() {
    ServiceLocator.registerFactoryParam<WebViewComponentProtocol, String>((webViewUrl) {
      return WebViewComponentViewModel(webViewUrl: webViewUrl);
    });
  }
}
