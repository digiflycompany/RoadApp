import 'package:roadapp/core/helpers/cache_helper/cache_helper.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_vars.dart';
import 'package:roadapp/core/helpers/logger.dart';
import 'package:roadapp/core/networking/api_error_handler.dart';
import 'package:roadapp/core/networking/api_result.dart';
import 'package:roadapp/core/networking/api_service.dart';
import 'package:roadapp/features/work_reports/data/models/review_model.dart';

class ReviewsRepo {
  final ApiService _apiService;
  ReviewsRepo(this._apiService);

  /// 🔹 Get Reviews List (Admin / Provider / Client)
  Future<ApiResult<ReviewsResponse>> getReviews({
    int page = 1,
    int limit = 10,
    String? sortBy,
    String? sortOrder,
  }) async {
    try {
      // Get token
      final token = await CacheHelper().getData(CacheVars.accessToken);
      final formattedToken = 'Bearer $token';

      // Call API
      final response = await _apiService.getReviews(
        formattedToken,
        page: page,
        limit: limit,
        sortBy: sortBy,
        sortOrder: sortOrder,
      );

      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
