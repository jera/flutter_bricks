import 'dart:ui';

import 'contact_us_view_controller.dart';
import 'enum/contact_us_options.dart';

class ContactUsViewModel extends ContactUsProtocol {
  bool _isLoading = false;
  String _explanationMessage = '';
  ContactUsOptions? _dropdownButtonValue;

  final List<ContactUsOptions> _dropdownButtonItems = [...ContactUsOptions.values];

  @override
  bool get isLoading => _isLoading;

  @override
  ContactUsOptions? get dropdownButtonValue => _dropdownButtonValue;

  @override
  List<ContactUsOptions> get dropdownButtonItems => _dropdownButtonItems;

  @override
  void didTapBackButton() {
    onTapBackButton?.call();
  }

  @override
  void didTapSelectContactUsOption(ContactUsOptions? contactUsOption) {
    const firstOption = 0;

    if (contactUsOption == null) return notifyListeners();

    _dropdownButtonValue = contactUsOption;
    _dropdownButtonItems.remove(contactUsOption);
    _dropdownButtonItems.insert(firstOption, contactUsOption);
    notifyListeners();
  }

  @override
  void updateExplanationMessage(String newExplanationMessage) {
    _explanationMessage = newExplanationMessage;
    notifyListeners();
  }

  @override
  VoidCallback? sendMessage() {
    if (_dropdownButtonValue != null && _explanationMessage.isNotEmpty) {
      return _didTapSendMessage;
    }

    return null;
  }

  void _didTapSendMessage() {
    _setIsLoading(isLoading: true);

    // TODO Implementar integração com a API para enviar a mensagem
  }

  void _setIsLoading({required bool isLoading}) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
