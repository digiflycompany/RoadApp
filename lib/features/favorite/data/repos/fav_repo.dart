import 'package:roadapp/core/helpers/cache_helper/cache_helper.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_vars.dart';
import 'package:roadapp/core/helpers/logger.dart';
import 'package:roadapp/core/networking/api_error_handler.dart';
import 'package:roadapp/core/networking/api_result.dart';
import 'package:roadapp/core/networking/api_service.dart';
import 'package:roadapp/features/favorite/data/models/add_to_fav_response.dart';
import 'package:roadapp/features/favorite/data/models/fav_response.dart';
import 'package:roadapp/features/favorite/data/models/unfav_response.dart';

class FavRepo {
  final ApiService _apiService;
  FavRepo(this._apiService);

  Future<ApiResult<FavResponse>> fetchFavAds() async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.fetchFavAds(formattedToken);
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.w(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<UnFavResponse>> unFav(String adId) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.unFav(formattedToken, adId);
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.w(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<AddToFavResponse>> addToFav(String adId) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.addToFav(formattedToken, adId);
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.w(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}