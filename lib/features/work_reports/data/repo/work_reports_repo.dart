import 'package:roadapp/features/work_reports/data/models/share_work_reports_response.dart';
import 'package:roadapp/features/work_reports/data/models/work_reports_response.dart';

import '../../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../../core/helpers/cache_helper/cache_vars.dart';
import '../../../../core/helpers/logger.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/approve_work_reports_response.dart';
import '../models/full_scan_report_response.dart';

class WorkReportsRepo{
  final ApiService _apiService;

  WorkReportsRepo(this._apiService);


  Future<ApiResult<WorkReportsResponse>> fetchWorkReports({
    String? status,
    required String startDate,
    required String endDate,
    required String type,
    required int page,
    required int limit,
  }) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';

    try {
      final response = await _apiService.fetchWorkReports(
        formattedToken,
        status,
        startDate,
        endDate,
        type,
        page,
        limit,
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


  Future<ApiResult<ApproveWorkReportsResponse>> approveWorkReport({
    required String id,
  }) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.approveWorkReports(
        formattedToken,
        id,
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ApproveWorkReportsResponse>> declineWorkReport({
    required String id,
  }) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.declineWorkReports(
        formattedToken,
        id,
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ShareWorkReportsResponse>> shareWorkReports({
    required String documentType,
    required String startDate,
    required String endDate,
  }) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response =
      await _apiService.shareWorkReport(formattedToken, documentType, startDate,endDate);
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


  Future<ApiResult<FullScanReportResponse>> fetchFullScanReport({
    required String startDate,
    required String endDate,
    required String scanType,
    required int page,
    required int limit,
     String? vehicleNumber,
  }) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';

    try {
      final response = await _apiService.fullScanReport(
        formattedToken,
        startDate,
        endDate,
        scanType,
        vehicleNumber,
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