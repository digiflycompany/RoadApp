import 'package:roadapp/core/helpers/cache_helper/cache_helper.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_vars.dart';
import 'package:roadapp/core/helpers/logger.dart';
import 'package:roadapp/core/networking/api_error_handler.dart';
import 'package:roadapp/core/networking/api_result.dart';
import 'package:roadapp/core/networking/api_service.dart';
import 'package:roadapp/features/reserve_appointment/data/models/reservations_response.dart';

class ReservationsRepo {
  final ApiService _apiService;
  ReservationsRepo(this._apiService);

  Future<ApiResult<ReservationsResponse>> fetchReservations() async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.fetchReservations(formattedToken);
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.f(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}