import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

import '../authentication_session/session_manager.dart';

abstract class AppEventManagerProtocol {
  void triggerEvent({
    required String eventName,
    Map<String, dynamic>? properties,
  });
}

abstract class MixPanelEventsProtocol extends AppEventManagerProtocol {
  void setupUser();
  Future<void> initMixpanel();
}

class FirebaseEvents extends AppEventManagerProtocol {
  static final AppEventManagerProtocol instance = FirebaseEvents._();
  final _firebaseAnalytics = FirebaseAnalytics.instance;

  FirebaseEvents._();

  @override
  Future<void> triggerEvent({required String eventName, Map<String, dynamic>? properties}) async {
    await _firebaseAnalytics.logEvent(name: eventName, parameters: properties);
  }
}

class MixpanelEvents extends MixPanelEventsProtocol {
  Mixpanel? _mixPanel;
  final SessionManagerProtocol _sessionManager = SessionManager.instance;
  static final MixPanelEventsProtocol instance = MixpanelEvents._();

  MixpanelEvents._();

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

    final user = _sessionManager.user;

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
  static const String propertyName = 'name';
  static const String propertyEmail = '\$email';
  static const String mixPanelToken = 'suaChaveDoMixPanel';
}
