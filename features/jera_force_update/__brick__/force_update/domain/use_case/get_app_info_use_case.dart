import 'dart:io';

import 'package:package_info_plus/package_info_plus.dart';

import '../models/app_info.dart';

typedef Completion = void Function(AppInfo appInfo);

abstract class GetAppInfoUseCaseProtocol {
  void execute({Completion? completion});
}

class GetAppInfoUseCase extends GetAppInfoUseCaseProtocol {
  // GetAppInfoUseCaseProtocol
  @override
  void execute({Completion? completion}) {
    PackageInfo.fromPlatform().then((packageInfo) {
      final appVersion = packageInfo.version.split('-').first;
      final platform = Platform.isAndroid ? 'android' : 'ios';

      final appInfo = AppInfo(version: appVersion, platform: platform);
      completion?.call(appInfo);
    });
  }
}
