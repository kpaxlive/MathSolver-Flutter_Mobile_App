import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class MediaService {
  final ImagePicker _picker = ImagePicker();

  Future<File?> pickImageFromGallery() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      File? croppedfile = await _cropImage(image.path);

      return croppedfile;
    } else {
      return null;
    }
  }

  Future captureImageWithCamera() async {
    XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      File? croppedFile = await _cropImage(image.path);

      return croppedFile;
    } else {
      return null;
    }
  }

  Future _cropImage(String imagePath) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imagePath,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
          hideBottomControls: false,
        ),
        IOSUiSettings(
          title: 'Crop Image',
          minimumAspectRatio: 0.1,
          aspectRatioLockEnabled: false,
        ),
      ],
    );
    return croppedFile != null ? File(croppedFile.path) : null;
  }
}
