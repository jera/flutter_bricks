import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';

import 'localization/localize.dart';
import 'router/mobile_router.dart';
import 'support/styles/app_themes.dart';
import 'support/utils/service_locator/service_locator.dart';

void main() {
  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    {{#with_go_router}}
    return MaterialApp.router(
      theme: AppThemes.theme,
      routerConfig: MobileRouter.router,
      supportedLocales: Localization.supportedLocales,
      localizationsDelegates: Localization.localizationsDelegates,
      onGenerateTitle: (context) => Localize.instance.of(context).appTitle,
    );{{/with_go_router}}
    {{^with_go_router}}
    return MaterialApp(
      theme: AppThemes.theme,
      routes: MobileRouter.routes,
      initialRoute: MobileRouter.initialRoute,
      supportedLocales: Localization.supportedLocales,
      localizationsDelegates: Localization.localizationsDelegates,
      onGenerateTitle: (context) => Localize.instance.of(context).appTitle,
    );{{/with_go_router}}
  }
}
