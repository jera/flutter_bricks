import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final String hint;
  final bool isPassword;
  final bool autoCorrect;

  final ValueChanged<String>? onChanged;

  /// Init
  const DefaultTextField({
    super.key,
    required this.hint,
    this.isPassword = false,
    this.autoCorrect = true,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: isPassword,
      autocorrect: autoCorrect,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.all(24),
        hintStyle: const TextStyle(color: Colors.white),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
