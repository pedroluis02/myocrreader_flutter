import 'package:flutter/material.dart';

import 'app.dart';
import 'service/services.dart';

void main() {
  runApp(OcrReaderApplication(
    title: 'OCR Reader Sample',
    imageTaker: ImageCaptureServiceImpl(),
    recognizer: TextRecognizerServiceImpl(),
  ));
}
