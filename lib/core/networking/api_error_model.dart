import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final bool? success;
  final String? message;
  final int? errorCode;
  final dynamic data;

  ApiErrorModel({
    this.success,
    this.message,
    this.errorCode,
    this.data,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      success: json['success'],
      message: json['message'],
      errorCode: json['errorCode'],
      data: json['data'],
    );
  }
}

