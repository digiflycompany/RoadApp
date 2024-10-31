import 'package:roadapp/core/helpers/cache_helper/cache_helper.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_vars.dart';
import 'package:roadapp/core/helpers/logger.dart';
import 'package:roadapp/core/networking/api_error_handler.dart';
import 'package:roadapp/core/networking/api_result.dart';
import 'package:roadapp/core/networking/api_service.dart';
import 'package:roadapp/features/password_recovery/data/model/send_code_response.dart';
import 'package:roadapp/features/password_recovery/data/model/verify_email_request_body.dart';

class RecoveryRepo {
  final ApiService _apiService;
  RecoveryRepo(this._apiService);

  Future<ApiResult<SendCodeResponse>> verifyEmail(VerifyEmailRequestBody body) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    try {
      final response = await _apiService.verifyEmail(token, body);
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}