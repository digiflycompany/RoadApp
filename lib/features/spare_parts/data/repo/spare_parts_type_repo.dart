import 'package:roadapp/features/spare_parts/data/models/produt_response.dart';

import '../../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../../core/helpers/cache_helper/cache_vars.dart';
import '../../../../core/helpers/logger.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';

class SparePartsTypeRepo {
  final ApiService _productType;
  SparePartsTypeRepo(this._productType);

  Future<ApiResult<ProductResponse>> getSparePartsType({
    required String searchField,
    required int page,
    required int limit,

  }) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _productType.fetchSparePartsType(
        formattedToken,
        searchField,
        page,
        limit,
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


  // Future<ApiResult<ServiceTypeResponse>> searchMaintenanceServiceType({
  //   required String searchField,
  //   required int page,
  //   required int limit,
  //
  // }) async {
  //   final token = await CacheHelper().getData(CacheVars.accessToken);
  //   final formattedToken = 'Bearer $token';
  //   try {
  //     final response = await _serviceType.searchMaintenanceServiceType(
  //       formattedToken,
  //       searchField,
  //       page,
  //       limit,
  //     );
  //     return ApiResult.success(response);
  //   } catch (error) {
  //     DefaultLogger.logger.e(error);
  //     return ApiResult.failure(ErrorHandler.handle(error));
  //   }
  // }


}