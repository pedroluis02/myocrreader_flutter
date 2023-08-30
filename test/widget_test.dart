import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myocrreader_flutter/app.dart';

import 'double_service/doubles.dart';

void main() {
  testWidgets('test initial widgets', (WidgetTester tester) async {
    const app = OcrReaderApplication(
      title: 'OCR Widget Test',
      imageTaker: ImageCaptureTestDummy(),
      recognizer: TextRecognizerTestDummy(),
    );

    await tester.pumpWidget(app);

    expect(find.text('OK'), findsNothing);
    expect(find.textContaining('Error:'), findsNothing);

    await tester.tap(find.byIcon(Icons.image));
    await tester.pump();

    expect(find.text('OK'), findsNothing);

    await tester.tap(find.byIcon(Icons.camera_alt));
    await tester.pump();

    expect(find.text('OK'), findsNothing);
  });

  testWidgets('test empty text recognizer', (WidgetTester tester) async {
    const app = OcrReaderApplication(
      title: 'OCR Widget Test',
      imageTaker: SampleImageCaptureTestStub(),
      recognizer: TextRecognizerTestDummy(),
    );

    await tester.pumpWidget(app);

    await tester.tap(find.byIcon(Icons.image));
    await tester.pump();

    expect(find.textContaining('Error:'), findsOneWidget);
  });

  testWidgets('test not empty text recognizer #1', (WidgetTester tester) async {
    const sampleImageTaker = SampleImageCaptureTestStub();
    final imageResult = await sampleImageTaker.loadImageCapture();

    const text = 'hello';

    const app = OcrReaderApplication(
      title: 'OCR Widget Test #1',
      imageTaker: sampleImageTaker,
      recognizer: TextRecognizerTestStub(text),
    );

    await tester.pumpWidget(app);

    await tester.tap(find.byIcon(Icons.image));
    await tester.pump();

    expect(find.image(FileImage(imageResult.file)), findsOneWidget);
    expect(find.text(text), findsOneWidget);
  });

  testWidgets('test not empty text recognizer #2', (WidgetTester tester) async {
    const sampleImageTaker = SampleImageCaptureTestStub();
    final imageResult = await sampleImageTaker.loadImageCapture();

    const text = 'hello-word';

    const app = OcrReaderApplication(
      title: 'OCR Widget Test #2',
      imageTaker: sampleImageTaker,
      recognizer: TextRecognizerTestStub(text),
    );

    await tester.pumpWidget(app);

    await tester.tap(find.byIcon(Icons.camera_alt));
    await tester.pump();

    expect(find.image(FileImage(imageResult.file)), findsOneWidget);
    expect(find.text(text), findsOneWidget);
  });
}
