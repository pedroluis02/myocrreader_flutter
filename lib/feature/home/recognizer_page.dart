import 'package:flutter/material.dart';

import '../../model/models.dart';
import '../../service/services.dart';
import 'image_capture_result.dart';
import 'status_result.dart';

typedef _ImageTakerFuture = Future<ImageCaptureResult> Function();

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
  late ImageCaptureResult _imageResult;
  late TextRecognitionResult _textResult;

  @override
  void initState() {
    super.initState();

    _lastErrorMessage = null;
    _imageResult = ImageCaptureResult.empty();
    _textResult = TextRecognitionResult.empty();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: _content(),
      )),
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

  Widget _content() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          'Recognize text from image',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        if (_imageResult.exists())
          ImageCaptureResultWidget(
            file: _imageResult.file,
            margin: const EdgeInsets.only(top: 16),
          ),
        const SizedBox(height: 16),
        StatusResultWidget(lastErrorMessage: _lastErrorMessage),
        const SizedBox(height: 8),
        Text(_textResult.text),
      ],
    );
  }

  void _onSelectImage() {
    _processSelectedImage(widget.imageTaker.loadImageCapture);
  }

  void _onTakePhoto() {
    _processSelectedImage(widget.imageTaker.takeImageCapture);
  }

  void _processSelectedImage(_ImageTakerFuture imageTakerFunc) async {
    _imageResult = await imageTakerFunc();
    debugPrint(_imageResult.path);

    if (_imageResult.exists()) {
      _recognizeImage(_imageResult.path);
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
