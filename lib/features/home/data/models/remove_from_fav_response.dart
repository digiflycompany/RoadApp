class RemoveFromFavResponse {
  final bool success;

  RemoveFromFavResponse({required this.success});

  factory RemoveFromFavResponse.fromJson(Map<String, dynamic> json) {
    return RemoveFromFavResponse(
      success: json['success'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
    };
  }
}
