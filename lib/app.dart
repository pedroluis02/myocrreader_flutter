import 'package:flutter/material.dart';

import '../service/services.dart';
import 'feature/home/recognizer_page.dart';

class OcrReaderApplication extends StatelessWidget {
  const OcrReaderApplication({
    super.key,
    required this.title,
    required this.imageTaker,
    required this.recognizer,
  });

  final String title;

  final ImageCaptureService imageTaker;
  final TextRecognizerService recognizer;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: TextRecognizerPage(
        title: 'Text Recognition',
        imageTaker: imageTaker,
        recognizer: recognizer,
      ),
    );
  }
}
