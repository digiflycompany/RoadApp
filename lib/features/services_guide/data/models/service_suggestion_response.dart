class ServiceSuggestionResponse {
  final bool success;
  final Data data;

  ServiceSuggestionResponse({required this.success, required this.data});

  factory ServiceSuggestionResponse.fromJson(Map<String, dynamic> json) {
    return ServiceSuggestionResponse(
      success: json['success'] as bool,
      data: Data.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.toJson(),
    };
  }
}

class Data {
  final String name;
  final String nameAr;
  final String status;
  final String creatorId;
  final String id;
  final String createdAt;
  final String updatedAt;
  final int version;

  Data({
    required this.name,
    required this.nameAr,
    required this.status,
    required this.creatorId,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      name: json['name'] as String,
      nameAr: json['nameAr'] as String,
      status: json['status'] as String,
      creatorId: json['creatorId'] as String,
      id: json['_id'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      version: json['__v'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'nameAr': nameAr,
      'status': status,
      'creatorId': creatorId,
      '_id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': version,
    };
  }
}
