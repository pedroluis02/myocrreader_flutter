import 'package:flutter_test/flutter_test.dart';

import 'double_service/stub.dart';

void main() {
  setUpAll(() {});

  test('test if image capture exists', () async {
    const imageTaker = ImageCaptureTestStub('ocr_sample.jpeg');
    final result = await imageTaker.takeImageCapture();

    expect(result.exists(), true, reason: '${result.path} not exists.');
  });

  test('test text recognition stub', () async {
    const text = 'hello';
    const recognizer = TextRecognizerTestStub(text);
    final result = await recognizer.recognize('');

    expect(result.text, text);
    expect(result.lines.length, 1);
  });

  tearDownAll(() {});
}
