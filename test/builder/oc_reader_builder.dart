import 'package:myocrreader_flutter/app.dart';
import 'package:myocrreader_flutter/service/services.dart';

import '../service_double/doubles.dart';

class OcrReaderAppBuilder {
  String? _title;
  ImageCaptureService? _imageTaker;
  TextRecognizerService? _recognizer;

  OcrReaderAppBuilder title(String text) {
    _title = text;
    return this;
  }

  OcrReaderAppBuilder imageCapture(ImageCaptureService service) {
    _imageTaker = service;
    return this;
  }

  OcrReaderAppBuilder textRecognizer(TextRecognizerService service) {
    _recognizer = service;
    return this;
  }

  OcrReaderApplication build() {
    return OcrReaderApplication(
      title: _title ?? 'OCR App Test',
      imageTaker: _imageTaker ?? const ImageCaptureTestDummy(),
      recognizer: _recognizer ?? const TextRecognizerTestDummy(),
    );
  }
}
