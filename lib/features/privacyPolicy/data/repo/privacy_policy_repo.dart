import 'package:roadapp/core/helpers/logger.dart';
import 'package:roadapp/features/privacyPolicy/data/models/privacy_police_response.dart';

import '../../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../../core/helpers/cache_helper/cache_vars.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';


class PrivacyPolicyRepo {
  final ApiService _center;
  PrivacyPolicyRepo(this._center);


  Future<ApiResult<PrivacyPolicyResponse>> fetchPrivacyPolicy() async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _center.fetchPrivacyPolicy(
        formattedToken,
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


}
