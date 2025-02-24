import 'package:roadapp/core/networking/api_service.dart';
import 'package:roadapp/features/clients/data/models/customer_reports_response_model.dart';
import '../../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../../core/helpers/cache_helper/cache_vars.dart';
import '../../../../core/helpers/logger.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../vehicles/data/models/vehicles_response.dart';


class CustomersReportRepo{
  final ApiService _apiService;
  CustomersReportRepo(this._apiService);

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

  Future<ApiResult<VehiclesResponse>> fetchVehiclesId(String id) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.fetchVehiclesId(
        formattedToken,
        id
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}