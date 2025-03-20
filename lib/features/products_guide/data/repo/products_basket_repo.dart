import 'package:roadapp/features/products_guide/data/models/delete_product_response.dart';
import 'package:roadapp/features/products_guide/data/models/update_product_request.dart';
import 'package:roadapp/features/products_guide/data/models/update_product_response.dart';

import '../../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../../core/helpers/cache_helper/cache_vars.dart';
import '../../../../core/helpers/logger.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../../spare_parts/data/models/produt_response.dart';
import '../../../spare_parts_centers/presentation/data/models/spare_parts_center_response.dart';
import '../models/product_request.dart';
import '../models/product_suggestion_request.dart';
import '../models/product_suggestion_response.dart';

class ProductsBasketRepo{
  final ApiService _serviceType;
  ProductsBasketRepo(this._serviceType);


  Future<ApiResult<SparePartsCenterResponse>> getProductType({
    required String maintenanceCenterId,
    required int page,
    required int limit,

  }) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _serviceType.fetchProductType(
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


  Future<ApiResult<SparePartsCenterResponse>> searchProductType({
    required String maintenanceCenterId,
    required String searchField,
    required int page,
    required int limit,

  }) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _serviceType.searchProductType(
        formattedToken,
        maintenanceCenterId,
        searchField,
        page,
        limit,
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


  Future<ApiResult<ProductResponse>> addProducts(ProductRequest productRequest) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _serviceType.addProducts(
          formattedToken,productRequest
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


  Future<ApiResult<ProductResponse>> productsTypeDropDown({
    required int page,
    required int limit,

  }) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _serviceType.fetchProductsTypeDropDawn(
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


  Future<ApiResult<ProductSuggestionResponse>> productSuggestion(ProductSuggestionRequest productSuggestionRequest) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _serviceType.productSuggestion(
          formattedToken,productSuggestionRequest
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


  Future<ApiResult<UpdateProductResponse>> updateProduct(
      String id,
      UpdateProductRequest updateProductRequest) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _serviceType.updateProduct(
          formattedToken,
          id,
          updateProductRequest
      );
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


  Future<ApiResult<DeleteProductResponse>> deleteProduct(
      String id,) async {
    final token = await CacheHelper().getData(CacheVars.accessToken);
    final formattedToken = 'Bearer $token';
    try {
      final response = await _serviceType.deleteProduct(
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