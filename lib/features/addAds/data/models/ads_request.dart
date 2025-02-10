class AdsRequest {
  final List<String> images;
  final String type;

  AdsRequest({required this.images, required this.type});

  factory AdsRequest.fromJson(Map<String, dynamic> json) {
    return AdsRequest(
      images: List<String>.from(json['images']),
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'images': images,
      'type': type,
    };
  }
}
