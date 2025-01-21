import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_helper.dart';
import 'package:roadapp/core/networking/api_result.dart';
import 'package:roadapp/core/networking/api_service.dart';
import 'package:roadapp/features/account/data/models/upload_image_response.dart';
import 'package:roadapp/features/addAds/data/models/ads_request.dart';
import 'package:roadapp/features/addAds/data/models/ads_response.dart';

import '../../../../core/helpers/cache_helper/cache_vars.dart';
import '../../../../core/helpers/logger.dart';
import '../../../../core/networking/api_error_handler.dart';

class AdsRepo {
  final ApiService _center;
  AdsRepo(this._center);


  Future<ApiResult<AddAdsResponse>> addAds(
      AdsRequest adsRequest) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _center.addAds(
        formattedToken,
        adsRequest,
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<UploadImageResponse>> uploadImage(XFile image) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';

    try {
      // تحويل الصورة إلى MultipartFile
      var imageFile = await MultipartFile.fromFile(image.path,
          filename: image.path.split('/').last);

      // إعداد FormData لرفع الصورة
      var formData = FormData.fromMap({
        'file': imageFile,  // تضمين MultipartFile في FormData
      });

      final response = await _center.uploadImages(
          formattedToken, formData
      );

      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


}
