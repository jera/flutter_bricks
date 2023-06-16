import 'initial_screen_view_controller.dart';

class InitialScreenViewModel extends InitialScreenProtocol {
  String _event = '';
  @override
  void didTapEvent() {
    // TODO: triggar _event no mixpanel/firebase
  }

  @override
  void updateEventName(String event) {
    _event = event;
  }
}
