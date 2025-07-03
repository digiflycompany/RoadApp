import 'package:roadapp/core/helpers/cache_helper/cache_helper.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_vars.dart';
import 'package:roadapp/core/helpers/logger.dart';
import 'package:roadapp/core/networking/api_error_handler.dart';
import 'package:roadapp/core/networking/api_result.dart';
import 'package:roadapp/core/networking/api_service.dart';
import 'package:roadapp/features/reserve_appointment/data/models/approve_reservation_client_response.dart';
import 'package:roadapp/features/reserve_appointment/data/models/declined_reservation_client_response.dart';
import 'package:roadapp/features/reserve_appointment/data/models/reservations_response.dart';
import 'package:roadapp/features/reserve_appointment/data/models/update_booking_request.dart';
import 'package:roadapp/features/reserve_appointment/data/models/update_booking_response.dart';

class ReservationsRepo {
  final ApiService _apiService;
  ReservationsRepo(this._apiService);

  Future<ApiResult<ReservationsResponse>> fetchReservations({int page = 1, int limit = 10,String? status}) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.fetchReservations(
          formattedToken,
          status!,
          page, limit);
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.f(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


  Future<ApiResult<UpdateBookingResponse>> updateBooking(UpdateBookingRequest updateBookingRequest,String id) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.updateBooking(
          formattedToken,
          updateBookingRequest,
          id,
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.f(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ApproveReservationClientResponse>> approveClientBooking(String id) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.approveBookingClients(
        formattedToken,
        id,
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.f(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


  Future<ApiResult<DeclinedReservationClientResponse>> declinedClientBooking(String id) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.declinedBookingClients(
        formattedToken,
        id,
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.f(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}