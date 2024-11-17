import 'package:roadapp/features/maintenance_center_details/data/models/booking_product_request.dart';

import '../../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../../core/helpers/cache_helper/cache_vars.dart';
import '../../../../core/helpers/logger.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';


class BookingProductRepo {
  final ApiService _apiService;

  BookingProductRepo(this._apiService);

  Future<ApiResult<BookingProductRequest>> createBooking(
      BookingProductRequest bookingProductRequest) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _apiService.createBooking(
        formattedToken,
        bookingProductRequest,
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
