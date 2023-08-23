import 'dart:async';

import 'package:myocrreader_flutter/model/models.dart';
import 'package:myocrreader_flutter/service/services.dart';

class ImageCaptureTestDummy implements ImageCaptureService {
  const ImageCaptureTestDummy();

  @override
  Future<ImageCaptureResult> loadImageCapture() async => ImageCaptureResult.empty();

  @override
  Future<ImageCaptureResult> takeImageCapture() async => ImageCaptureResult.empty();
}

class TextRecognizerTestDummy implements TextRecognizerService {
  const TextRecognizerTestDummy();

  @override
  FutureOr<void> close() {}

  @override
  Future<TextRecognitionResult> recognize(String imagePath) async => TextRecognitionResult.empty();
}
