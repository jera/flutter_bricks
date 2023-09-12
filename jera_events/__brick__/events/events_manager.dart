import 'events_provider_enum.dart';
import 'helpers/firebase_event_helper.dart';
import 'helpers/mixpanel_event_helper.dart';

abstract class EventManagerProtocol {
  Future<void> initEventProviders();
  void triggerEvent({
    required String eventName,
    Map<String, dynamic>? properties,
    EventProviderEnum triggerProvider = EventProviderEnum.all,
  });
}

class EventManager extends EventManagerProtocol {
  static final EventManagerProtocol instance = EventManager._();

  final firebaseEventManager = FirebaseEventsHelper.instance;
  final mixPanelEventManager = MixpanelEventsHelper.instance;
  EventManager._();

  @override
  Future<void> initEventProviders() async {
    mixPanelEventManager.initMixpanel();
  }

  @override
  Future<void> triggerEvent({
    required String eventName,
    Map<String, dynamic>? properties,
    EventProviderEnum triggerProvider = EventProviderEnum.all,
  }) async {
    switch (triggerProvider) {
      case EventProviderEnum.all:
        firebaseEventManager.triggerEvent(eventName: eventName, properties: properties);
        mixPanelEventManager.triggerEvent(eventName: eventName, properties: properties);
        break;
      case EventProviderEnum.firebase:
        firebaseEventManager.triggerEvent(eventName: eventName, properties: properties);
        break;
      case EventProviderEnum.mixPanel:
        mixPanelEventManager.triggerEvent(eventName: eventName, properties: properties);
        break;
    }
  }
}
