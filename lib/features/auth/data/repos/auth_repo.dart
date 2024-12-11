import 'package:roadapp/core/helpers/logger.dart';
import 'package:roadapp/core/networking/api_error_handler.dart';
import 'package:roadapp/core/networking/api_result.dart';
import 'package:roadapp/core/networking/api_service.dart';
import 'package:roadapp/features/auth/data/models/login_request_body.dart';
import 'package:roadapp/features/auth/data/models/login_response.dart';
import 'package:roadapp/features/auth/data/models/client_register_request_body.dart';
import 'package:roadapp/features/auth/data/models/client_register_response.dart';
import 'package:roadapp/features/auth/data/models/provider_register_request_body.dart';
import 'package:roadapp/features/auth/data/models/provider_register_response.dart';

import '../../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../../core/helpers/cache_helper/cache_vars.dart';
import '../models/profile_data_response.dart';

class AuthRepo {
  final ApiService _apiService;
  AuthRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ClientRegisterResponse>> clientSignUp(
      ClientRegisterRequestBody requestBody) async {
    try {
      final response = await _apiService.clientRegister(requestBody);
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ProviderRegisterResponse>> providerSignUp(
      ProviderRegisterRequestBody requestBody) async {
    try {
      final response = await _apiService.providerRegister(requestBody);
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<UserResponse>> getProfileUserData() async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.getProfileData(
        formattedToken,
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}