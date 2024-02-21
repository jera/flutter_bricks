import 'package:flutter/material.dart';

class MediaPickerEditView extends StatelessWidget {
  final bool isVisible;
  final VoidCallback onTapEdit;
  final VoidCallback onTapDelete;

  const MediaPickerEditView({
    super.key,
    required this.isVisible,
    required this.onTapEdit,
    required this.onTapDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: onTapEdit,
            style: IconButton.styleFrom(
              // TODO: Aqui precisa usar AppColors
              backgroundColor: Colors.black.withOpacity(0.5),
            ),
            icon: const Icon(
              Icons.edit_outlined,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: onTapDelete,
            style: IconButton.styleFrom(
              // TODO: Aqui precisa usar AppColors
              backgroundColor: Colors.black.withOpacity(0.5),
            ),
            icon: const Icon(
              Icons.delete_outline,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
