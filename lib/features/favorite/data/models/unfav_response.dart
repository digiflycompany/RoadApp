class UnFavResponse {
  bool? success;

  UnFavResponse({this.success});

  factory UnFavResponse.fromJson(Map<String, dynamic> json) {
    return UnFavResponse(success: json['success'] as bool?);
  }

  Map<String, dynamic> toJson() {
    return {'success': success};
  }
}