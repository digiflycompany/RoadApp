import 'package:roadapp/core/helpers/cache_helper/cache_helper.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_vars.dart';
import 'package:roadapp/core/helpers/logger.dart';
import 'package:roadapp/core/networking/api_error_handler.dart';
import 'package:roadapp/core/networking/api_result.dart';
import 'package:roadapp/core/networking/api_service.dart';
import 'package:roadapp/features/calendar/data/models/add_memo_request_body.dart';
import 'package:roadapp/features/calendar/data/models/add_memo_response.dart';
import 'package:roadapp/features/calendar/data/models/memos_response.dart';

import '../../../clients/data/models/customer_reports_response_model.dart';
import '../../../vehicles/data/models/vehicles_response.dart';

class MemosRepo {
  final ApiService _apiService;
  MemosRepo(this._apiService);

  Future<ApiResult<MemosResponse>> fetchMemos({String? order,String? vehicleId,String? clientId,String? type, int page = 1, int limit = 10}) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.fetchMemos(
          formattedToken,
          vehicleId,
          clientId,
          type,
          order, page, limit);
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.t(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<AddMemoResponse>> addMemoClient(AddMemoClientRequestBody body) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.addClientMemo(formattedToken, body);
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.t(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<AddMemoResponse>> addMemoProvider(AddMemoProviderRequestBody body) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.addProviderMemo(formattedToken, body);
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.t(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<VehiclesResponse>> fetchVehicles({int page = 1, int limit = 20}) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';

    try {
      final response = await _apiService.fetchVehicles(formattedToken, page, limit);

      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


  Future<ApiResult<CustomerReportsResponseModel>> getCustomerReports() async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.fetchCustomerReports(
        formattedToken,
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


}