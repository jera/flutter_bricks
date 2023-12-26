import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultTextField extends StatelessWidget {
  final String hint;
  final bool isPassword;
  final bool autoCorrect;
  final String? errorText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final BoxConstraints? suffixIconConstraints;
  final List<TextInputFormatter>? inputFormatters;

  /// Init
  const DefaultTextField({
    required this.hint,
    super.key,
    this.isPassword = false,
    this.autoCorrect = false,
    this.onChanged,
    this.errorText,
    this.suffixIcon,
    this.keyboardType,
    this.inputFormatters,
    this.suffixIconConstraints,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      onChanged: onChanged,
      obscureText: isPassword,
      autocorrect: autoCorrect,
      cursorColor: Colors.green,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.all(12),
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        suffixIcon: suffixIcon,
        suffixIconConstraints: suffixIconConstraints,
        errorText: errorText,
      ),
    );
  }
}
