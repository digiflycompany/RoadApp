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

  Future<ApiResult<ReportResponse>> getReports({
    required String parameterValue,
    required String startDate,
    required String endDate,
    required int page,
    required int limit,
  }) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.getReportsList(
        formattedToken,
        parameterValue,
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

  Future<ApiResult<ReportRequest>> addReport(ReportRequest reportRequest) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.addReport(formattedToken, reportRequest);
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}

// class ReportRepo {
//   final ApiService _apiService;
//   ReportRepo(this._apiService);
//
//   Future<ApiResult<ReportResponse>> getReports(String parameterValue) async {
//     final token = await CacheHelper().getData(CacheVars.accessToken);
//     final formattedToken = 'Bearer $token';
//     try {
//       final response = await _apiService.getReportsList(formattedToken,parameterValue);
//       return ApiResult.success(response);
//     } catch (error) {
//       DefaultLogger.logger.e(error);
//       return ApiResult.failure(ErrorHandler.handle(error));
//     }
//   }
//
//   Future<ApiResult<ReportRequest>> addReport(
//       ReportRequest reportRequest) async {
//     final token = await CacheHelper().getData(CacheVars.accessToken);
//     final formattedToken = 'Bearer $token';
//     try {
//       final response = await _apiService.addReport(formattedToken,reportRequest);
//       return ApiResult.success(response);
//     } catch (error) {
//       DefaultLogger.logger.e(error);
//       return ApiResult.failure(ErrorHandler.handle(error));
//     }
//   }
//
// }