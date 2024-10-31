import 'package:roadapp/core/networking/api_service.dart';

class VehiclesRepo {
  final ApiService _apiService;
  VehiclesRepo(this._apiService);

/*  Future<ApiResult<VehiclesResponse>> fetchVehicles() async {
    try {
      final response = await _apiService.fetchVehicles();
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ClientRegisterResponse>> clientSignUp(
      ClientRegisterRequestBody requestBody) async {
    try {
      final response = await _apiService.clientRegister(requestBody);
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ProviderRegisterResponse>> providerSignUp(
      ProviderRegisterRequestBody requestBody) async {
    try {
      final response = await _apiService.providerRegister(requestBody);
      return ApiResult.success(response);
    } catch (error) {
      DefaultLogger.logger.e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }*/
}