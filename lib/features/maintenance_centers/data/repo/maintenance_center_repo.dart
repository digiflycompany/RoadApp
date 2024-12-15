import '../../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../../core/helpers/cache_helper/cache_vars.dart';
import '../../../../core/helpers/logger.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/maintenance_center_model.dart';

class MaintenanceCenterRepo {
  final ApiService _center;
  MaintenanceCenterRepo(this._center);

  Future<ApiResult<MaintenanceCenterModel>> getMaintenanceCenter({
    required String brandId,
    required String typeId,
    required String orderByCost,
    required int page,
    required int limit,

  }) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _center.fetchMaintenanceCenter(
        formattedToken,
        brandId,
        typeId,
        'cost',
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