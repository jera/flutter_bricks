import 'package:flutter/material.dart';

class MediaPickerAddView extends StatelessWidget {
  final String title;
  final Widget iconTitle;
  final bool isVisible;

  const MediaPickerAddView({
    super.key,
    required this.title,
    required this.isVisible,
    required this.iconTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconTitle,
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            // TODO: Aqui precisa usar AppColors e AppFonts
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
