class DeleteServiceResponse {
  final bool? success;

  DeleteServiceResponse({this.success});

  factory DeleteServiceResponse.fromJson(Map<String, dynamic> json) {
    return DeleteServiceResponse(
      success: json['success'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
    };
  }
}
