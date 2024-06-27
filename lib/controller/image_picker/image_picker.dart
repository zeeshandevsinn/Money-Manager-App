import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImagePicker {
  late final File profileImage;
  late final String ImagePath;

  Future<void> _pickImage() async {
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        profileImage = File(image.path);
      } else {
        print('no Image has been picked');
      }
    } else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        // ignore: unused_local_variable
        var byte = await image.readAsBytes();
      } else {
        print('no Image has been picked');
      }
    }
  }
}
