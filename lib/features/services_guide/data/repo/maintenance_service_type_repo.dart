import '../../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../../core/helpers/cache_helper/cache_vars.dart';
import '../../../../core/helpers/logger.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../../maintenance_centers/data/models/maintenance_center_model.dart';
import '../../../maintenance_service/data/models/maintenance_service_model.dart';

class MaintenanceServiceTypeVendorRepo{
  final ApiService _serviceType;
  MaintenanceServiceTypeVendorRepo(this._serviceType);


  // Maintenance Service Type
  Future<ApiResult<MaintenanceCenterModel>> getMaintenanceServiceType({
    required String maintenanceCenterId,
    required int page,
    required int limit,

  }) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _serviceType.fetchMaintenanceCenterVendor(
        formattedToken,
        maintenanceCenterId,
        page,
        limit,
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


  Future<ApiResult<MaintenanceCenterModel>> searchMaintenanceServiceType({
    required String maintenanceCenterId,
    required String searchField,
    required int page,
    required int limit,

  }) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _serviceType.searchMaintenanceCenterVendor(
        formattedToken,
        maintenanceCenterId,
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

  Future<ApiResult<ServiceTypeResponse>> maintenanceServiceTypeDropDown({
    required int page,
    required int limit,

  }) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _serviceType.fetchMaintenanceServiceType(
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


}