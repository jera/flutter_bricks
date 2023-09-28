import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';

import 'remote_config_values.dart';

abstract class RemoteConfigProviderProtocol {
  Future<void> initialize();
  String getString(String key);
  int getInt(String key);
}

class RemoteConfigProvider extends RemoteConfigProviderProtocol {
  static RemoteConfigProviderProtocol instance = RemoteConfigProvider._();

  static final _remoteConfig = FirebaseRemoteConfig.instance;

  RemoteConfigProvider._();

  @override
  Future<void> initialize() async {
    await _remoteConfig.setDefaults(RemoteConfigValues.defaultValues);
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(minutes: kDebugMode ? 1 : 120),
    ));
    await _remoteConfig.fetchAndActivate();
  }

  @override
  String getString(String key) {
    return _remoteConfig.getString(key);
  }

  @override
  int getInt(String key) {
    return _remoteConfig.getInt(key);
  }
}
