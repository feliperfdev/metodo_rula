import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:images_picker/images_picker.dart';

abstract class ImagePickerController {
  Future<Media?> openCamera();
}

class ImagePickerControllerImpl implements ImagePickerController {
  @override
  Future<Media?> openCamera() async {
    final res = await ImagesPicker.openCamera();
    if (res != null && kDebugMode) {
      log(res.first.size.toString());
      log(res.first.path);
    }
    return res?.first;
  }
}
