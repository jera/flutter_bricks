import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final String hint;
  final bool isPassword;
  final bool autoCorrect;

  final ValueChanged<String>? onChanged;

  /// Init
  const DefaultTextField({
    required this.hint,
    super.key,
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
      cursorColor: Colors.green,
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
      ),
    );
  }
}
