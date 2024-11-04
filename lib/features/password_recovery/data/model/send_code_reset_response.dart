class SendCodeResetResponse {
  final bool? success;
  final String? token;

  SendCodeResetResponse({this.success, this.token});

  factory SendCodeResetResponse.fromJson(Map<String, dynamic> json) {
    return SendCodeResetResponse(
        success: json['success'] as bool?, token: json['data'] as String?);
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'data': token};
  }
}