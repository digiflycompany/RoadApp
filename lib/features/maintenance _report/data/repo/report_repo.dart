import 'package:roadapp/core/helpers/logger.dart';
import 'package:roadapp/core/networking/api_error_handler.dart';
import 'package:roadapp/core/networking/api_result.dart';
import 'package:roadapp/core/networking/api_service.dart';
import 'package:roadapp/features/maintenance%20_report/data/models/list_reports_model.dart';
import 'package:roadapp/features/maintenance%20_report/data/models/report_request.dart';
import '../../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../../core/helpers/cache_helper/cache_vars.dart';

class ReportRepo {
  final ApiService _apiService;
  ReportRepo(this._apiService);

  Future<String> _authHeader() async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    return 'Bearer $token';
  }

  Future<ApiResult<ReportResponse>> getFullScanReports({
    required String vehicleNumber,
    required String startDate,
    required String endDate,
    required int page,
    required int limit,
  }) async {
    try {
      final response = await _apiService.getReportsList(
        await _authHeader(),
        vehicleNumber,
        startDate,
        endDate,
        page,
        limit,
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ReportResponse>> getRegularReports({
    required String vehicleId,
    required String startDate,
    required String endDate,
    required int page,
    required int limit,
  }) async {
    try {
      final response = await _apiService.getRegularReports(
        await _authHeader(),
        vehicleId,
        startDate,
        endDate,
        page,
        limit,
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ReportRequest>> addReport(
      ReportRequest reportRequest) async {
    try {
      final response =
          await _apiService.addReport(await _authHeader(), reportRequest);
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
