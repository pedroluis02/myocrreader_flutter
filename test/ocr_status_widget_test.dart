import 'package:flutter_test/flutter_test.dart';

import 'builder/oc_reader_builder.dart';
import 'mock/ocr_inout_mock.dart';

const successRecognitionText = 'OK';
const failRecognitionText = 'Error:';
const expectedTitle = 'My OCR Reader';

void main() {
  testWidgets('initial state', (tester) async {
    final appMock = await _createMockAndInit(tester);

    //appMock.expectedText(expectedTitle, findsWidgets);

    appMock.expectedText(successRecognitionText, findsNothing);
    appMock.expectedTextContaining(failRecognitionText, findsNothing);
  });

  testWidgets('without success with image selection', (tester) async {
    final appMock = await _createMockAndInit(tester);

    await appMock.tapByImageSelection();
    appMock.expectedText(successRecognitionText, findsNothing);
  });

  testWidgets('without success with action camera', (tester) async {
    final appMock = await _createMockAndInit(tester);

    await appMock.tapByCameraAction();
    appMock.expectedText(successRecognitionText, findsNothing);
  });
}

Future<OcrReaderExpectedInOutMock> _createMockAndInit(WidgetTester tester) {
  final app = OcrReaderAppBuilder().title(expectedTitle).build();
  return OcrReaderExpectedInOutMock.createAndInit(app, tester);
}
