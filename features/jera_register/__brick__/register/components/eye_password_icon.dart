import 'package:flutter/material.dart';

class EyePasswordIcon extends StatelessWidget {
  final bool isObscureText;
  final VoidCallback? onTap;

  const EyePasswordIcon({
    required this.onTap,
    required this.isObscureText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: InkWell(
        onTap: onTap,
        child: Icon(
          isObscureText ? Icons.visibility_off : Icons.remove_red_eye,
          color: isObscureText ? Colors.grey : Colors.green,
        ),
      ),
    );
  }
}
