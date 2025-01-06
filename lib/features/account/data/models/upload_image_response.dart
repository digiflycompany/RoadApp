class UploadImageResponse {
  final String message;
  final FileData file;

  UploadImageResponse({required this.message, required this.file});

  factory UploadImageResponse.fromJson(Map<String, dynamic> json) {
    return UploadImageResponse(
      message: json['message'],
      file: FileData.fromJson(json['file']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'file': file.toJson(),
    };
  }
}

class FileData {
  final String path;
  final String mimetype;
  final int size;

  FileData({required this.path, required this.mimetype, required this.size});

  factory FileData.fromJson(Map<String, dynamic> json) {
    return FileData(
      path: json['path'],
      mimetype: json['mimetype'],
      size: json['size'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'mimetype': mimetype,
      'size': size,
    };
  }
}
