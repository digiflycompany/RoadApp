import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_helper.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_vars.dart';
import 'package:roadapp/core/helpers/functions/general_functions.dart';
import 'package:roadapp/core/helpers/logger.dart';
import 'package:roadapp/core/networking/api_error_handler.dart';
import 'package:roadapp/core/networking/api_result.dart';
import 'package:roadapp/core/networking/api_service.dart';
import 'package:roadapp/features/account/data/models/account_response.dart';
import 'package:roadapp/features/account/data/models/update_mc_request_body.dart';
import 'package:roadapp/features/account/data/models/update_mc_response.dart';
import 'package:roadapp/features/account/data/models/update_profile_request_body.dart';
import 'package:roadapp/features/account/data/models/update_profile_response.dart';
import 'package:roadapp/features/account/data/models/upload_image_request.dart';
import 'package:roadapp/features/account/data/models/upload_image_response.dart';

import '../models/profile_user_response.dart';

class AccountRepo {
  final ApiService _apiService;
  AccountRepo(this._apiService);

  Future<ApiResult<AccountResponse>> fetchAccount() async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.fetchAccount(formattedToken);
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ProfileUserResponse>> fetchUserAccount() async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.fetchUserAccount(formattedToken);
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<UpdateProfileResponse>> updateProfile(UpdateProfileRequestBody body) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.updateProfile(formattedToken, body);
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


  Future<ApiResult<UpdateMcResponse>> updateMcProfile(UpdateMcRequestBody body) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.updateMCprofile(formattedToken, body);
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<UploadImageResponse>> uploadImage(XFile image) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';

    try {
      // تحويل الصورة إلى MultipartFile
      var imageFile = await MultipartFile.fromFile(image.path,
          filename: image.path.split('/').last);

      // إعداد FormData لرفع الصورة
      var formData = FormData.fromMap({
        'file': imageFile,  // تضمين MultipartFile في FormData
      });

      final response = await _apiService.uploadImages(
          formattedToken, formData
      );

      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}