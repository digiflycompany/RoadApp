import 'package:roadapp/core/helpers/cache_helper/cache_helper.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_vars.dart';
import 'package:roadapp/core/helpers/logger.dart';
import 'package:roadapp/core/networking/api_error_handler.dart';
import 'package:roadapp/core/networking/api_result.dart';
import 'package:roadapp/core/networking/api_service.dart';
import 'package:roadapp/features/fuel_consuming_rate/data/model/add_rate_request_body.dart';
import 'package:roadapp/features/fuel_consuming_rate/data/model/add_rate_response.dart';
import 'package:roadapp/features/fuel_consuming_rate/data/model/fuel_rates_response.dart';

class FuelRatesRepo {
  final ApiService _apiService;
  FuelRatesRepo(this._apiService);

  Future<ApiResult<FuelRatesResponse>> fetchFuelRates() async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.fetchFuelRates(formattedToken);
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<AddRateResponse>> addRate(AddRateRequestBody body) async {
    try {
      final token = await CacheHelper().getData(CacheVars.accessToken);

      if (token == null || token.isEmpty) {
        return ApiResult.failure(
            ErrorHandler.handle('Access token is missing or invalid'));
      }

      final formattedToken = 'Bearer $token';

      final response = await _apiService.addRate(formattedToken, body);

      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.d('Error in addRate: $error');
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}