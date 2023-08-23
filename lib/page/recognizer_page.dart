import 'package:flutter/material.dart';

import '../model/models.dart';
import '../service/services.dart';

class TextRecognizerPage extends StatefulWidget {
  const TextRecognizerPage({
    super.key,
    required this.title,
    required this.imageTaker,
    required this.recognizer,
  });

  final String title;

  final ImageCaptureService imageTaker;
  final TextRecognizerService recognizer;

  @override
  State<TextRecognizerPage> createState() => _PageState();
}

class _PageState extends State<TextRecognizerPage> {
  late String? _lastErrorMessage;
  late TextRecognitionResult _textResult;

  @override
  void initState() {
    super.initState();

    _lastErrorMessage = null;
    _textResult = TextRecognitionResult.empty();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Recognize text from image',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            _resultStatusWidget(context),
            const SizedBox(height: 8),
            Text(_textResult.text),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _onSelectImage,
            tooltip: 'Select image',
            backgroundColor: Colors.red,
            child: const Icon(Icons.image),
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            onPressed: _onTakePhoto,
            tooltip: 'Take photo',
            child: const Icon(Icons.camera_alt),
          )
        ],
      ),
    );
  }

  Widget _resultStatusWidget(BuildContext context) {
    final defTextStyle = Theme.of(context).textTheme.headlineSmall;
    Color textStyleColor;
    String message;
    if (_lastErrorMessage == null) {
      textStyleColor = Colors.black;
      message = '';
    } else if (_lastErrorMessage?.isEmpty == true) {
      textStyleColor = Colors.green;
      message = 'OK';
    } else {
      textStyleColor = Colors.red;
      message = 'Error: $_lastErrorMessage';
    }

    return Text(
      message,
      style: defTextStyle?.copyWith(color: textStyleColor, fontWeight: FontWeight.bold),
    );
  }

  void _onSelectImage() async {
    final result = await widget.imageTaker.loadImageCapture();
    _processResult(result);
  }

  void _onTakePhoto() async {
    final result = await widget.imageTaker.takeImageCapture();
    _processResult(result);
  }

  void _processResult(ImageCaptureResult result) {
    debugPrint(result.path);

    if (result.exists()) {
      _recognizeImage(result.path);
    }
  }

  void _recognizeImage(String path) async {
    final result = await widget.recognizer.recognize(path);
    final errorMessage = (result.isNotEmpty()) ? '' : 'Empty text result.';

    setState(() {
      _lastErrorMessage = errorMessage;
      _textResult = result;
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.recognizer.close();
  }
}
