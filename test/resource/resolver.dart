import 'dart:io';

import 'package:myocrreader_flutter/model/models.dart';

class TestResourceResolver {
  static const String _assetsDirName = 'assets';
  static const String sampleImageCapture = 'ocr_sample.jpeg';

  const TestResourceResolver._();

  static ImageCaptureResult getResourceAsImageCapture(String name) {
    final imagePath = getResourcePath(name);
    return ImageCaptureResult(imagePath);
  }

  static String getResourcePath(String name) => '${Directory.current.path}/$_assetsDirName/$name';
}
