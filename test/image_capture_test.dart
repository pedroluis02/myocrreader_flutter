import 'package:flutter_test/flutter_test.dart';

import 'service_double/doubles.dart';

void main() {
  group('Text Recognizer Service', () {
    test('text should be empty', () async {
      const recognizer = TextRecognizerTestDummy();
      final result = await recognizer.recognize('');

      final isEmptyResult = !result.isNotEmpty();

      expect(isEmptyResult, true);
    });

    test('input text should be returned text', () async {
      const expectedText = 'hello';
      const recognizer = TextRecognizerTestStub(expectedText);
      final result = await recognizer.recognize('');

      expect(result.text, expectedText);
      expect(result.lines.length, 1);
    });
  });
}
