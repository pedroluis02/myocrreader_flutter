import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myocrreader_flutter/app.dart';
import 'package:myocrreader_flutter/model/models.dart';

class OcrReaderExpectedInOutMock {
  final String expectText;
  final ImageCaptureResult expectedImageResult;

  final WidgetTester tester;
  final OcrReaderApplication app;

  const OcrReaderExpectedInOutMock._(
    this.app,
    this.tester,
    this.expectText,
    this.expectedImageResult,
  );

  Future<void> init() {
    return tester.pumpWidget(app);
  }

  Future<void> tapByCameraAction() {
    return _tapByIcon(Icons.camera_alt);
  }

  Future<void> tapByImageSelection() {
    return _tapByIcon(Icons.image);
  }

  void expectedRecognitionResult() {
    expectedText(expectText, findsOneWidget);
    expect(find.image(FileImage(expectedImageResult.file)), findsOneWidget);
  }

  void expectedText(String text, dynamic matcher) {
    expect(find.text(text), matcher);
  }

  void expectedTextContaining(Pattern pattern, dynamic matcher) {
    expect(find.textContaining(pattern), findsNothing);
  }

  Future<void> _tapByIcon(IconData icon) async {
    await tester.tap(find.byIcon(icon));
    await tester.pump();
  }

  static Future<OcrReaderExpectedInOutMock> createAndInit(
    OcrReaderApplication app,
    WidgetTester tester, {
    String? expectedText,
    ImageCaptureResult? expectedImageResult,
  }) async {
    final mock = OcrReaderExpectedInOutMock._(
      app,
      tester,
      expectedText ?? '',
      expectedImageResult ?? ImageCaptureResult.empty(),
    );
    await mock.init();

    return mock;
  }
}
