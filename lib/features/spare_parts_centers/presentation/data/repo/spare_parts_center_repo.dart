import 'package:roadapp/features/spare_parts_centers/presentation/data/models/spare_parts_center_response.dart';

import '../../../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../../../core/helpers/cache_helper/cache_vars.dart';
import '../../../../../core/helpers/logger.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_service.dart';

class SparePartsCenterRepo {
  final ApiService _center;
  SparePartsCenterRepo(this._center);

  Future<ApiResult<SparePartsCenterResponse>> getSparePartsCenter({
    required String typeId,
    required String orderByCost,
    required int page,
    required int limit,

  }) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _center.fetchSparePartsCenter(
        formattedToken,
        typeId,
        'price.finalPrice',
        orderByCost,
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