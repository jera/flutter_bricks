import 'edit_profile_view_controller.dart';

class EditProfileViewModel extends EditProfileProtocol {
  @override
  String get email => '';

  @override
  String get name => '';

  @override
  String get avatarUrl => '';

  @override
  void didTapEditAvatar() {
    // TODO: implement didTapEditAvatar
  }

  @override
  void didTapSaveData() {
    // TODO: implement didTapSaveData
  }

  @override
  void updateEmail(String text) {
    // TODO: implement updateEmail
  }

  @override
  void updateName(String text) {
    // TODO: implement updateName
  }

  @override
  void didTapGoBack() {
    onTapGoBack?.call();
  }

  @override
  void didTapSettings() {
    onTapSettings?.call();
  }
}
