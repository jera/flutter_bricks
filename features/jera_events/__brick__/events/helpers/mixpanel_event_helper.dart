import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

abstract class MixPanelEventsHelperProtocol {
  void setupUser();
  Future<void> initMixpanel();
  void triggerEvent({
    required String eventName,
    Map<String, dynamic>? properties,
  });
}

class MixpanelEventsHelper extends MixPanelEventsHelperProtocol {
  Mixpanel? _mixPanel;
  //TODO Adicionar sessionManager para fazer o setup do user;
  // final SessionManagerProtocol _sessionManager = SessionManager.instance;
  static final MixPanelEventsHelperProtocol instance = MixpanelEventsHelper._();

  MixpanelEventsHelper._();

  @override
  Future<void> initMixpanel() async {
    _mixPanel = await Mixpanel.init(
      mixPanelToken,
      trackAutomaticEvents: false,
    );
  }

  @override
  void triggerEvent({
    required String eventName,
    Map<String, dynamic>? properties,
  }) {
    if (_cantTriggerEvent) return;

    _mixPanel?.track(eventName, properties: properties);
  }

  @override
  Future<void> setupUser() async {
    if (_cantTriggerEvent) return;

    const user = null; // _sessionManager.user;

    final anonymousUserId = await _appPlatformTokenId;
    _mixPanel?.identify(user?.id ?? anonymousUserId);
    _mixPanel?.getPeople().set(propertyName, user?.name ?? anonymousUserName);
    _mixPanel?.getPeople().set(propertyEmail, user?.email ?? anonymousUserEmail);
  }

  bool get _cantTriggerEvent {
    final isMixpanelInvalid = _mixPanel == null;

    return kDebugMode || isMixpanelInvalid;
  }

  Future<String> get _appPlatformTokenId async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id;
    } else {
      final iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor ?? anonymousUserId;
    }
  }

  /// Constants do Mixpanel
  static const String anonymousUserId = 'anonymous-user';
  static const String anonymousUserName = 'Usuário anônimo';
  static const String anonymousUserEmail = 'anonymous@email.com';
  static const String propertyName = 'user_name';
  static const String propertyEmail = 'user_email';
  static const String mixPanelToken = 'suaChaveDoMixPanel';
}
