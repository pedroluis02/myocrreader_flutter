import 'package:image_picker/image_picker.dart';

import '../../model/models.dart';
import '../image_capture_service.dart';

class ImageCaptureServiceImpl implements ImageCaptureService {
  final _picker = ImagePicker();

  @override
  Future<ImageCaptureResult> loadImageCapture() async {
    final result = await _picker.pickImage(source: ImageSource.gallery);
    return _processResult(result);
  }

  @override
  Future<ImageCaptureResult> takeImageCapture() async {
    final result = await _picker.pickImage(source: ImageSource.camera);
    return _processResult(result);
  }

  ImageCaptureResult _processResult(XFile? result) {
    if (result == null) {
      return ImageCaptureResult.empty();
    }

    return ImageCaptureResult(result.path);
  }
}
