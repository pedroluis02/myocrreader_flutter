import '../model/models.dart';

abstract class ImageCaptureService {
  Future<ImageCaptureResult> loadImageCapture();

  Future<ImageCaptureResult> takeImageCapture();
}
