import 'package:roadapp/features/spare_parts_center_details/data/models/booking_spare_parts.dart';

import '../../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../../core/helpers/cache_helper/cache_vars.dart';
import '../../../../core/helpers/logger.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';

class SparePartsCenterDetailsRepo {
  final ApiService _center;
  SparePartsCenterDetailsRepo(this._center);

  Future<ApiResult<BookingSpareParts>> createBookingSpareParts(
      BookingSpareParts bookingSparePartsRequest) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _center.createBookingSpareParts(
        formattedToken,
        bookingSparePartsRequest,
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }

  }



}