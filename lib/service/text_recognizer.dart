import 'dart:async';

import '../model/models.dart';

abstract class TextRecognizerService {
  Future<TextRecognitionResult> recognize(String imagePath);

  FutureOr<void> close();
}
