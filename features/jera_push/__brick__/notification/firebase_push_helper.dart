import 'package:firebase_messaging/firebase_messaging.dart';

import 'notification_helper.dart';
import 'models/notification_info.dart';

abstract class FirebasePushHelperHelperProtocol {
  Future<void> initPushConfiguration();
  Future<void> saveToken();
}

class FirebasePushHelper extends FirebasePushHelperHelperProtocol {
  static final FirebasePushHelperHelperProtocol instance = FirebasePushHelper._();
  FirebasePushHelper._();

  final messaging = FirebaseMessaging.instance;
  final notificationHelper = NotificationHelper.instance;

  @override
  Future<void> initPushConfiguration() async {
    await messaging.requestPermission();
    await _setupTerminatedNotify();
    _setupForegroundNotify();
    _setupClickNotify();
  }

  @override
  Future<void> saveToken() async {
    await messaging.getToken().then((token) {
      //todo mandar token para api
    });

    messaging.onTokenRefresh.listen((newToken) {
      //todo mandar token para api
    });
  }

  Future<void> _setupTerminatedNotify() async {
    final initialMsg = await messaging.getInitialMessage();
    if (initialMsg == null) return;

    _messageShowHandler(initialMsg);
  }

  void _setupForegroundNotify() {
    FirebaseMessaging.onMessage.listen(_messageShowHandler);
  }

  void _setupClickNotify() {
    {{#has_redirect}}
    FirebaseMessaging.onMessageOpenedApp.listen(_clickHandler);
    {{/has_redirect}}
  }
}

@pragma('vm:entry-point')
void _messageShowHandler(RemoteMessage message) {
  final notificationHelper = NotificationHelper.instance;
  final notificationInfo = NotificationInfo.fromFirebaseMessage(message: message);
  notificationHelper.showNotification(notificationInfo);
}

{{#has_redirect}}
@pragma('vm:entry-point')
Future<void> _clickHandler(RemoteMessage message) async {
  final data = NotificationData.fromMap(message.data);

  if(data.id == != '-1') {
    final id = data.id.toString();

    MobileRouter.redirectToInternalPage(id: id);
  }
}
{{/has_redirect}}
