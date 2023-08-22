import 'dart:async';

import 'package:myocrreader_flutter/model/models.dart';
import 'package:myocrreader_flutter/service/services.dart';

class TextRecognizerTestStub implements TextRecognizerService {
  final String text;

  const TextRecognizerTestStub(this.text);

  @override
  FutureOr<void> close() {}

  @override
  Future<TextRecognitionResult> recognize(String imagePath) async {
    return TextRecognitionResult(text, <String>[text]);
  }
}
