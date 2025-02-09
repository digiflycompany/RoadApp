class AdsRequest {
  final List<String> images;

  AdsRequest({required this.images});

  factory AdsRequest.fromJson(Map<String, dynamic> json) {
    return AdsRequest(
      images: List<String>.from(json['images']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'images': images,
    };
  }
}
