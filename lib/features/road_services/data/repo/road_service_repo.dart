
import 'package:roadapp/core/networking/api_service.dart';

import '../../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../../core/helpers/cache_helper/cache_vars.dart';
import '../../../../core/helpers/logger.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../models/road_service_model.dart';


class RoadServiceRepo {
  final ApiService _roadServiceService;
  RoadServiceRepo(this._roadServiceService);

  Future<ApiResult<RoadServicesResponse>> getRoadService({
    required String type,
    required int page,
    required int limit,
  }) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _roadServiceService.getRoadService(
        formattedToken,
        type,
        page,
        limit,
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

}