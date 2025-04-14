import 'package:roadapp/features/search/data/models/car_brand_model.dart';
import 'package:roadapp/features/search/data/models/countries_model.dart';

import '../../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../../core/helpers/cache_helper/cache_vars.dart';
import '../../../../core/helpers/logger.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../../vehicles/data/models/brands_response.dart';
import '../../../vehicles/data/models/vehicles_response.dart';

class SearchRepo {
  final ApiService _search;
  SearchRepo(this._search);

  Future<ApiResult<CountriesModel>> getCountries(
      {required int page, required int limit}) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _search.fetchCountries(
        formattedToken,
        page,
        limit,
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<BrandsResponse>> getCarBrand() async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _search.fetchBrands(
        formattedToken,
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<VehiclesResponse>> fetchVehicles({int page = 1, int limit = 10}) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';

    try {
      final response = await _search.fetchVehicles(formattedToken, page, limit);

      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}