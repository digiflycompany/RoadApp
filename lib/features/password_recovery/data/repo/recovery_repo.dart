import 'package:roadapp/core/helpers/cache_helper/cache_helper.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_vars.dart';
import 'package:roadapp/core/helpers/logger.dart';
import 'package:roadapp/core/networking/api_error_handler.dart';
import 'package:roadapp/core/networking/api_result.dart';
import 'package:roadapp/core/networking/api_service.dart';
import 'package:roadapp/features/password_recovery/data/model/get_code_request_body.dart';
import 'package:roadapp/features/password_recovery/data/model/send_code_reset_response.dart';
import 'package:roadapp/features/password_recovery/data/model/send_code_response.dart';
import 'package:roadapp/features/password_recovery/data/model/send_email_response.dart';
import 'package:roadapp/features/password_recovery/data/model/verify_email_request_body.dart';
import 'package:roadapp/features/password_recovery/data/model/verify_email_reset_request_body.dart';

class RecoveryRepo {
  final ApiService _apiService;
  RecoveryRepo(this._apiService);

  Future<ApiResult<SendCodeResponse>> verifyEmail(VerifyEmailRequestBody body) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    try {
      final response = await _apiService.verifyEmail('Bearer $token', body);
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<SendCodeResetResponse>> verifyEmailToReset(VerifyEmailResetRequestBody body) async {
    try {
      final response = await _apiService.verifyEmailToReset(body);
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<SendEmailResponse>> getCode(GetCodeRequestBody body) async {
    try {
      final response = await _apiService.getCode(body);
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}