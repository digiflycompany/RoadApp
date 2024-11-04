import 'package:roadapp/core/helpers/logger.dart';
import 'package:roadapp/core/networking/api_error_handler.dart';
import 'package:roadapp/core/networking/api_result.dart';
import 'package:roadapp/core/networking/api_service.dart';
import 'package:roadapp/features/auth/data/models/login_request_body.dart';
import 'package:roadapp/features/auth/data/models/login_response.dart';
import 'package:roadapp/features/auth/data/models/client_register_request_body.dart';
import 'package:roadapp/features/auth/data/models/client_register_response.dart';
import 'package:roadapp/features/auth/data/models/provider_register_request_body.dart';
import 'package:roadapp/features/auth/data/models/provider_register_response.dart';
import 'package:roadapp/features/maintenance%20_report/data/models/list_reports_model.dart';

class ReportRepo {
  final ApiService _apiService;
  ReportRepo(this._apiService);

  // Future<ApiResult<ListReportsModel>> getReports(
  //     ListReportsModel listReportsModel) async {
  //   try {
  //     final response = await _apiService.getReportsList(listReportsModel);
  //     return ApiResult.success(response);
  //   } catch (error) {
  //     DefaultLogger.logger.e(error);
  //     return ApiResult.failure(ErrorHandler.handle(error));
  //   }
  // }

}