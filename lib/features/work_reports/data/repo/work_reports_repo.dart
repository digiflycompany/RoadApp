import 'package:roadapp/features/work_reports/data/models/work_reports_response.dart';

import '../../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../../core/helpers/cache_helper/cache_vars.dart';
import '../../../../core/helpers/logger.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';

class WorkReportsRepo{
  final ApiService _apiService;

  WorkReportsRepo(this._apiService);


  Future<ApiResult<WorkReportsResponse>> fetchWorkReports({
    required String startDate,
    required String endDate,
    required String type,
    required int page,
    required int limit,
  }) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.fetchWorkReports(
        formattedToken,
        startDate,
        endDate,
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