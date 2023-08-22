import 'package:flutter_test/flutter_test.dart';

import 'double_service/stub.dart';

void main() {
  setUpAll(() {});

  test('test text recognition stub', () async {
    const text = 'hello';
    const recognizer = TextRecognizerTestStub(text);
    final result = await recognizer.recognize('');

    expect(result.text, text);
    expect(result.lines.length, 1);
  });

  tearDownAll(() {});
}
