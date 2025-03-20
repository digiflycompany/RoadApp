import 'package:roadapp/features/business_models/data/models/product_request_body.dart';
import 'package:roadapp/features/business_models/data/models/product_response.dart';
import 'package:roadapp/features/clients/data/models/customer_reports_response_model.dart';
import '../../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../../core/helpers/cache_helper/cache_vars.dart';
import '../../../../core/helpers/logger.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../../spare_parts_centers/presentation/data/models/spare_parts_center_response.dart';
import '../models/maintenance_response_model.dart';
import '../models/receipt_request_body.dart';
import '../models/request_examination_body.dart';
import '../models/response_examination.dart';

class BusinessModelsRepo {
  final ApiService _center;

  BusinessModelsRepo(this._center);

  Future<ApiResult<SparePartsCenterResponse>> getProduct({
    required String maintenanceCenterId,
    required int page,
    required int limit,
  }) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _center.fetchProduct(
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

  Future<ApiResult<MaintenanceResponse>> getMaintenanceCenter({
    required int page,
    required int limit,
  }) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _center.getAllMaintenanceCenter(
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

  // إضافة سند صرف
  Future<ApiResult<ProductAddResponse>> addPaymentVoucher(
      ProductRequestBody productRequestBody) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _center.addPaymentVoucher(
        formattedToken,
        productRequestBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ProductAddResponse>> addReceiptVoucher(
      ReceiptRequestBody receiptRequestBody) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _center.addReceiptVoucher(
        formattedToken,
        receiptRequestBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }



  // Bill OF Sell (فتورة بيع)
  Future<ApiResult<ProductAddResponse>> addBillOfSellVoucher(
      ProductRequestBody productRequestBody) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _center.addBillOfSellVoucher(
        formattedToken,
        productRequestBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ExaminationResponse>> addFullScanReport(
      RequestExaminationBody requestExaminationBody) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _center.addFullScanReport(
        formattedToken,
        requestExaminationBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<CustomerReportsResponseModel>> getCustomerReports() async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _center.fetchCustomerReports(
        formattedToken,
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


}
