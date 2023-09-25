import 'dart:async';

import 'package:myocrreader_flutter/model/models.dart';
import 'package:myocrreader_flutter/service/services.dart';

import '../resource_resolver.dart';

class SampleImageCaptureTestStub extends ImageCaptureTestStub {
  const SampleImageCaptureTestStub() : super(TestResourceResolver.sampleImageCapture);
}

class ImageCaptureTestStub implements ImageCaptureService {
  final String imageName;

  const ImageCaptureTestStub(this.imageName);

  @override
  Future<ImageCaptureResult> loadImageCapture() async => _loadLocalImage();

  @override
  Future<ImageCaptureResult> takeImageCapture() async => _loadLocalImage();

  ImageCaptureResult _loadLocalImage() => TestResourceResolver.getResourceAsImageCapture(imageName);
}

class TextRecognizerTestStub implements TextRecognizerService {
  final String text;

  const TextRecognizerTestStub(this.text);

  @override
  FutureOr<void> close() {}

  @override
  Future<TextRecognitionResult> recognize(String imagePath) async =>
      TextRecognitionResult(text, <String>[text]);
}
