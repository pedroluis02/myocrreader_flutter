import 'dart:io';

class ImageCaptureResult {
  final String path;

  const ImageCaptureResult(this.path);

  File get file => File(path);

  bool exists() => (path.isNotEmpty) ? file.existsSync() : false;

  factory ImageCaptureResult.empty() => const ImageCaptureResult('');
}
