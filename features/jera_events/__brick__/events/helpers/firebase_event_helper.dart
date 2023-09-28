import 'package:firebase_analytics/firebase_analytics.dart';

abstract class FirebaseEventsHelperProtocol {
  void triggerEvent({
    required String eventName,
    Map<String, dynamic>? properties,
  });
}

class FirebaseEventsHelper extends FirebaseEventsHelperProtocol {
  static final FirebaseEventsHelperProtocol instance = FirebaseEventsHelper._();

  final _firebaseAnalytics = FirebaseAnalytics.instance;

  FirebaseEventsHelper._();

  @override
  Future<void> triggerEvent({required String eventName, Map<String, dynamic>? properties}) async {
    await _firebaseAnalytics.logEvent(name: eventName, parameters: properties);
  }
}
