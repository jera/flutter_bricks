import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationInfo {
  final String title;
  final String subtitle;
  final String channelId;
  final String channelName;

  NotificationInfo({
    required this.title,
    required this.subtitle,
    required this.channelId,
    required this.channelName,
  });

  NotificationInfo.fromFirebaseMessage({required RemoteMessage message})
      : title = message.notification?.title ?? '',
        subtitle = message.notification?.body ?? '',
        channelId = 'firebase-notify-channel',
        channelName = 'notify-news';
}
