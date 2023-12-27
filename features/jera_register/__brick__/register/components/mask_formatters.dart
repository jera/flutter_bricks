import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MaskFormatters {
  static MaskTextInputFormatter phoneNumberMask = MaskTextInputFormatter(
    mask: '(00) 0 0000-0000',
    filter: {'0': RegExp(r'[0-9]')},
  );

  static MaskTextInputFormatter cpfNumberMask = MaskTextInputFormatter(
    mask: '000.000.000-00',
    filter: {'0': RegExp(r'[0-9]')},
  );
}
