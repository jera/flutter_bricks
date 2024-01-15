import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationInfo {
  final String title;
  final String subtitle;
  final String channelId;
  final String channelName;
  {{#has_payload}}
  final NotificationData data;
  {{/has_payload}}

  NotificationInfo({
    required this.title,
    required this.subtitle,
    required this.channelId,
    required this.channelName,
    required this.data,
  });

  NotificationInfo.fromFirebaseMessage({required RemoteMessage message})
      : title = message.notification?.title ?? '',
        subtitle = message.notification?.body ?? '',
        channelId = '{{project_name.snakeCase()}}',
        channelName = 'notify-news',
        data = NotificationData.fromMap(message.data);
}
