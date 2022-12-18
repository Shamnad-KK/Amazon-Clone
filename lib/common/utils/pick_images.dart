import 'dart:developer';

import 'package:image_picker/image_picker.dart';

class PickImage {
  static Future<List<XFile>> pickMultipleImages() async {
    List<XFile> images = [];
    try {
      List<XFile>? files = await ImagePicker().pickMultiImage();
      if (files.isNotEmpty) {
        for (var file in files) {
          images.add(XFile(file.path));
        }
      }
    } catch (e) {
      log(e.toString());
    }
    return images;
  }
}
