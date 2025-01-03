import 'package:roadapp/core/helpers/cache_helper/cache_helper.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_vars.dart';
import 'package:roadapp/core/helpers/logger.dart';
import 'package:roadapp/core/networking/api_error_handler.dart';
import 'package:roadapp/core/networking/api_result.dart';
import 'package:roadapp/core/networking/api_service.dart';
import 'package:roadapp/features/vendor_reservations_management/data/models/approve_booking_model.dart';
import 'package:roadapp/features/vendor_reservations_management/data/models/decline_booking_model.dart';
import 'package:roadapp/features/vendor_reservations_management/data/models/reservation_managment_model.dart';

class ReservationManagementRepo {
  final ApiService _apiService;
  ReservationManagementRepo(this._apiService);
  Future<ApiResult<BookingResponse>> getBookingData({
    required int page,
    required int limit,
  }) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response =
          await _apiService.getBookingProviders(formattedToken, page, limit);
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  ///---------------------APPROVE BOOKING---------------------///
  Future<ApiResult<ApproveBookingResponse>> approveBooking({    required String id,})async{
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.approveBooking(
        formattedToken,
        id,
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  ///---------------------DECLINE BOOKING---------------------///
  Future<ApiResult<DeclineBookingResponse>> declineBooking({required String id})async{
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.declineBooking(
        formattedToken,
        id,
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

}
