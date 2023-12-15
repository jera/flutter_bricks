import '../helpers/cpf_validator.dart';

extension StringValidations on String {
  bool isEmail() {
    const emailRegEx = '[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}';

    return contains(RegExp(emailRegEx));
  }

  bool isDocument() {
    return CPFValidator.isValid(this);
  }
}
