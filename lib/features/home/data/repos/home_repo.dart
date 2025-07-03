import 'package:roadapp/core/helpers/cache_helper/cache_helper.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_vars.dart';
import 'package:roadapp/core/helpers/logger.dart';
import 'package:roadapp/core/networking/api_error_handler.dart';
import 'package:roadapp/core/networking/api_result.dart';
import 'package:roadapp/core/networking/api_service.dart';
import 'package:roadapp/features/favorite/data/models/add_to_fav_response.dart';
import 'package:roadapp/features/home/data/models/ads_response.dart';
import 'package:roadapp/features/home/data/models/country_model.dart';
import 'package:roadapp/features/home/data/models/remove_from_fav_response.dart';

class HomeRepo {
  final ApiService _apiService;
  HomeRepo(this._apiService);

  Future<ApiResult<CountryModel>> getCountryById(String id) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.getCountryById(formattedToken, id);
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.w(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<AdsResponse>> fetchAds(
      {int page = 1, int limit = 9,List<String>? type,}) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.fetchAds(formattedToken,type!, page, limit);
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<AddToFavResponse>> addToFav({
    required String id,
  }) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.addToFavor(
        formattedToken,
        id,
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


  Future<ApiResult<RemoveFromFavResponse>> removeFromFav({
    required String id,
  }) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.removeFromFavor(
        formattedToken,
        id,
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


}