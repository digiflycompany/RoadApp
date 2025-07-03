class AddAdsResponse {
  final bool success;
  final Data data;

  AddAdsResponse({required this.success, required this.data});

  factory AddAdsResponse.fromJson(Map<String, dynamic> json) {
    return AddAdsResponse(
      success: json['success'],
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
  final String maintenanceCenterId;
  final List<String> images;
  final String status;
  final String id;
  final int version;

  Data({
    required this.maintenanceCenterId,
    required this.images,
    required this.status,
    required this.id,
    required this.version,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      maintenanceCenterId: json['maintenanceCenterId'],
      images: List<String>.from(json['images']),
      status: json['status'],
      id: json['_id'],
      version: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maintenanceCenterId': maintenanceCenterId,
      'images': images,
      'status': status,
      '_id': id,
      '__v': version,
    };
  }
}
