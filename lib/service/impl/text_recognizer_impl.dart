import 'dart:async';

import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import '../../model/models.dart';
import '../text_recognizer.dart';

class TextRecognizerServiceImpl implements TextRecognizerService {
  final _textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

  @override
  Future<TextRecognitionResult> recognize(String imagePath) async {
    final inputImage = InputImage.fromFilePath(imagePath);
    final recognizedText = await _textRecognizer.processImage(inputImage);

    return recognizedText.toCustomResult();
  }

  @override
  FutureOr<void> close() {
    _textRecognizer.close();
  }
}

extension _RecognizedTextExt on RecognizedText {
  TextRecognitionResult toCustomResult() {
    return TextRecognitionResult(text, _extractAllLines());
  }

  List<String> _extractAllLines() {
    final lines = <String>[];
    for (var block in blocks) {
      lines.addAll(block.lines.map((textLine) => textLine.text).toList());
    }
    return lines;
  }
}
