import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'models/notification_info.dart';

abstract class NotificationHelperProtocol {
  Future<void> showNotification(NotificationInfo notificationData);
}

class NotificationHelper extends NotificationHelperProtocol {
  static NotificationHelperProtocol instance = NotificationHelper._();
  static final _localNotificationsPlugin = FlutterLocalNotificationsPlugin();

  NotificationHelper._();

  @override
  Future<void> showNotification(NotificationInfo notificationData) async {
    _localNotificationsPlugin.show(
      Random().nextInt(100000),
      notificationData.title,
      notificationData.subtitle,
      {{#has_payload}}
      payload: notificationData.data.toMap(),
      {{/has_payload}}
      _getNotificationDetails(notificationData),
    );
  }

  NotificationDetails _getNotificationDetails(NotificationInfo notificationInfo) {
    const iosNotificationDetails = DarwinNotificationDetails();

    final androidNotificationDetails = AndroidNotificationDetails(
      priority: Priority.high,
      importance: Importance.max,
      notificationInfo.channelId,
      notificationInfo.channelName,
      // TODO adicionar o path do ícone da notificação
      icon: '{path_do_icone}',
    );
    return NotificationDetails(
      iOS: iosNotificationDetails,
      android: androidNotificationDetails,
    );
  }
}
