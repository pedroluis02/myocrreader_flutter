import 'package:flutter_test/flutter_test.dart';

import 'builder/oc_reader_builder.dart';
import 'mock/ocr_inout_mock.dart';
import 'service_double/doubles.dart';

const expectedText = 'hello';

void main() {
  testWidgets('text and image by camera action', (tester) async {
    final appMock = await _createMockAndInit(tester);
    await appMock.tapByCameraAction();

    appMock.expectedRecognitionResult();
  });

  testWidgets('text and image by image selection', (tester) async {
    final appMock = await _createMockAndInit(tester);
    await appMock.tapByImageSelection();

    appMock.expectedRecognitionResult();
  });
}

Future<OcrReaderExpectedInOutMock> _createMockAndInit(WidgetTester tester) async {
  const sampleImageTaker = SampleImageCaptureTestStub();
  final app = OcrReaderAppBuilder()
      .imageCapture(sampleImageTaker)
      .textRecognizer(const TextRecognizerTestStub(expectedText))
      .build();

  final imageCaptureResult = await sampleImageTaker.loadImageCapture();

  return OcrReaderExpectedInOutMock.createAndInit(
    app,
    tester,
    expectedText: expectedText,
    expectedImageResult: imageCaptureResult,
  );
}
