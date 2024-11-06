class SendEmailResponse {
  final bool? success;
  final bool? data;

  SendEmailResponse({this.success, this.data});

  factory SendEmailResponse.fromJson(Map<String, dynamic> json) {
    return SendEmailResponse(
        success: json['success'] as bool?, data: json['data'] as bool?);
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'data': data};
  }
}