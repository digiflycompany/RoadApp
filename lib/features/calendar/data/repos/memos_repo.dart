import 'package:roadapp/core/helpers/cache_helper/cache_helper.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_vars.dart';
import 'package:roadapp/core/helpers/logger.dart';
import 'package:roadapp/core/networking/api_error_handler.dart';
import 'package:roadapp/core/networking/api_result.dart';
import 'package:roadapp/core/networking/api_service.dart';
import 'package:roadapp/features/calendar/data/models/memos_response.dart';

class MemosRepo {
  final ApiService _apiService;
  MemosRepo(this._apiService);

  Future<ApiResult<MemosResponse>> fetchMemos() async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.fetchMemos(formattedToken);
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.v(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}