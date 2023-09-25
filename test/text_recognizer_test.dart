import 'package:flutter_test/flutter_test.dart';

import 'service_double/doubles.dart';

void main() {
  group('Image Capture Service', () {
    test('image should exist', () async {
      const imageTaker = SampleImageCaptureTestStub();
      final result = await imageTaker.takeImageCapture();

      expect(result.exists(), true, reason: '${result.path} not exists.');
    });

    test('image should not exist', () async {
      const imageTaker = ImageCaptureTestStub('hello.png');
      final result = await imageTaker.takeImageCapture();

      expect(result.exists(), false, reason: '${result.path} exists.');
    });
  });
}
