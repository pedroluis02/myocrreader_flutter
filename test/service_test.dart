import 'package:flutter_test/flutter_test.dart';

import 'double_service/doubles.dart';

void main() {
  setUpAll(() {});

  test('test when image capture exists', () async {
    const imageTaker = SampleImageCaptureTestStub();
    final result = await imageTaker.takeImageCapture();

    expect(result.exists(), true, reason: '${result.path} not exists.');
  });

  test('test when image capture does not exist', () async {
    const imageTaker = ImageCaptureTestStub('hello.png');
    final result = await imageTaker.takeImageCapture();

    expect(result.exists(), false, reason: '${result.path} exists.');
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
