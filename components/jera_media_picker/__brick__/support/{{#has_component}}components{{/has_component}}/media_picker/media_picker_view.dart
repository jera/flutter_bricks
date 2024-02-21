import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../helpers/local_media_picker.dart';
import 'media_picker_add_view.dart';
import 'media_picker_edit_view.dart';
import 'media_picker_image_source_view.dart';

enum MediaPickerSource { image, video }

class MediaPickerView extends StatefulWidget {
  final double? height;
  final String? coverUrl;
  final String? coverPath;

  final String title;
  final double aspectRatio;

  final VoidCallback onFailure;
  final VoidCallback onTapDelete;
  final ValueChanged<XFile> onSuccess;

  final BoxShape shape;
  final Widget iconTitle;
  final MediaPickerSource source;
  final LocalMediaPickerProtocol localMediaPicker;

  const MediaPickerView({
    required this.title,
    required this.iconTitle,
    required this.onSuccess,
    required this.onFailure,
    required this.onTapDelete,
    required this.localMediaPicker,
    this.source = MediaPickerSource.image,
    this.height,
    this.coverUrl,
    this.coverPath,
    this.aspectRatio = 16 / 9,
    this.shape = BoxShape.rectangle,
    super.key,
  });

  @override
  State<MediaPickerView> createState() => _MediaPickerViewState();
}

class _MediaPickerViewState extends State<MediaPickerView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: AspectRatio(
        aspectRatio: widget.aspectRatio,
        child: InkWell(
          onTap: _showBottomSheetChooseImage,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              shape: widget.shape,
              // TODO: Aqui precisa usar AppColors
              color: Colors.grey,
              image: _boxDecorationImage,
              borderRadius: switch (widget.shape) {
                BoxShape.circle => null,
                BoxShape.rectangle => BorderRadius.circular(20),
              },
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: MediaPickerAddView(
                    title: widget.title,
                    iconTitle: widget.iconTitle,
                    isVisible: widget.coverUrl == null && widget.coverPath == null,
                  ),
                ),
                MediaPickerEditView(
                  onTapDelete: widget.onTapDelete,
                  onTapEdit: _showBottomSheetChooseImage,
                  isVisible: widget.coverUrl != null || widget.coverPath != null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DecorationImage? get _boxDecorationImage {
    ImageProvider<Object>? image;
    if (widget.coverUrl case final String url) image = NetworkImage(url);
    if (widget.coverPath case final String path) image = FileImage(File(path));

    if (image == null) return null;

    return DecorationImage(fit: BoxFit.cover, image: image);
  }

  void _showBottomSheetChooseImage() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return MediaPickerSelectImageSourceView(
          secondColor: Colors.grey,
          primaryColor: Colors.white,
          onTapCamera: () {
            switch (widget.source) {
              case MediaPickerSource.image:
                widget.localMediaPicker.pickImageBySource(
                  imageSource: ImageSource.camera,
                  failure: widget.onFailure,
                  success: widget.onSuccess,
                );
              case MediaPickerSource.video:
                widget.localMediaPicker.pickVideoBySource(
                  imageSource: ImageSource.camera,
                  failure: widget.onFailure,
                  success: widget.onSuccess,
                );
            }

            Navigator.pop(context);
          },
          onTapGallery: () {
            switch (widget.source) {
              case MediaPickerSource.image:
                widget.localMediaPicker.pickImageBySource(
                  imageSource: ImageSource.gallery,
                  failure: widget.onFailure,
                  success: widget.onSuccess,
                );
              case MediaPickerSource.video:
                widget.localMediaPicker.pickVideoBySource(
                  imageSource: ImageSource.gallery,
                  failure: widget.onFailure,
                  success: widget.onSuccess,
                );
            }

            Navigator.pop(context);
          },
        );
      },
    );
  }
}
