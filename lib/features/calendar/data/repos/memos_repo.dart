import 'package:roadapp/core/helpers/cache_helper/cache_helper.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_vars.dart';
import 'package:roadapp/core/helpers/logger.dart';
import 'package:roadapp/core/networking/api_error_handler.dart';
import 'package:roadapp/core/networking/api_result.dart';
import 'package:roadapp/core/networking/api_service.dart';
import 'package:roadapp/features/calendar/data/models/add_memo_request_body.dart';
import 'package:roadapp/features/calendar/data/models/add_memo_response.dart';
import 'package:roadapp/features/calendar/data/models/memos_response.dart';

class MemosRepo {
  final ApiService _apiService;
  MemosRepo(this._apiService);

  Future<ApiResult<MemosResponse>> fetchMemos({String? order, int page = 1, int limit = 10}) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.fetchMemos(formattedToken, order, page, limit);
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.t(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<AddMemoResponse>> addMemo(AddMemoRequestBody body) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.addMemo(formattedToken, body);
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.t(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}