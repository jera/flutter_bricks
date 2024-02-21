import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

typedef Failure = VoidCallback;
typedef Success = void Function(XFile file);

abstract class LocalMediaPickerProtocol {
  void pickImageBySource({required ImageSource imageSource, Success? success, Failure? failure});
  void pickVideoBySource({required ImageSource imageSource, Success? success, Failure? failure});
}

class LocalMediaPicker extends LocalMediaPickerProtocol {
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void pickImageBySource({required ImageSource imageSource, Success? success, Failure? failure}) async {
    try {
      final file = await _imagePicker.pickImage(source: imageSource);

      if (file != null) success?.call(file);
    } on Exception catch (_) {
      failure?.call();
      rethrow;
    }
  }

  @override
  void pickVideoBySource({required ImageSource imageSource, Success? success, Failure? failure}) async {
    try {
      final file = await _imagePicker.pickVideo(source: imageSource);

      if (file != null) success?.call(file);
    } on Exception catch (_) {
      failure?.call();
      rethrow;
    }
  }
}
