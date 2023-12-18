import 'bottom_navigation_view_controller.dart';

class BottomNavigationViewModel extends BottomNavigationViewProtocol {
  @override
  void didTapSelectedIndex(int index) {
    onTapBottomNavigationItem?.call(index);
  }
}
