import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageRequest {
  final dynamic file;

  UploadImageRequest({required this.file});

  Map<String, dynamic> toJson() {
    return {
      'file': file,
    };
  }
}
