import 'package:flutter/material.dart';

class MediaPickerSelectImageSourceView extends StatelessWidget {
  final Color primaryColor;
  final Color secondColor;

  VoidCallback onTapCamera;
  VoidCallback onTapGallery;

  const MediaPickerSelectImageSourceView({
    required this.primaryColor,
    required this.secondColor,
    required this.onTapCamera,
    required this.onTapGallery,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: secondColor,
        borderRadius: const BorderRadiusDirectional.only(
          topStart: Radius.circular(22),
          topEnd: Radius.circular(22),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: onTapCamera,
                icon: Icon(
                  size: 28,
                  color: primaryColor,
                  Icons.camera_alt_rounded,
                ),
              ),
              // TODO: Aqui precisa do L10n e AppFonts e AppColors
              Text(
                'Câmera',
                style: TextStyle(
                  fontSize: 12,
                  color: primaryColor,
                ),
              )
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: onTapGallery,
                icon: Icon(
                  size: 28,
                  Icons.filter_sharp,
                  color: primaryColor,
                ),
              ),
              // TODO: Aqui precisa do L10n e AppFonts e AppColors
              Text(
                'Galeria',
                style: TextStyle(
                  fontSize: 12,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
