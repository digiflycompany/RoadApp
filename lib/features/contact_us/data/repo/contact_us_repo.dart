import 'package:roadapp/core/networking/api_service.dart';
import 'package:roadapp/features/contact_us/data/models/contact_us_response.dart';

import '../../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../../core/helpers/cache_helper/cache_vars.dart';
import '../../../../core/helpers/logger.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../models/contact_us_request.dart';
import '../models/support_type_response.dart';

class ContactUsRepo {
  final ApiService _apiService;
  ContactUsRepo(this._apiService);


  Future<ApiResult<ContactUsResponse>> contactUs({
    required ContactUsRequest body,
  }) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.contactUs(
        formattedToken,
        body,
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


  Future<ApiResult<SupportTypeResponse>> fetchSupportTypes() async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.fetchSupportTypes(
        formattedToken,
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


}