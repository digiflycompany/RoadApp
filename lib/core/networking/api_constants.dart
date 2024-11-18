
import 'package:roadapp/core/helpers/string_manager.dart';

class ApiConstants {
  static const String baseUrl = "https://roadapp-api.vercel.app/";
  static const String login = 'api/v1/users/login';
  static const String clientSignUp = 'api/v1/users/client/signup';
  static const String providerSignUp = 'api/v1/users/provider/signup';
  static const String verifyEmail = 'api/v1/users/verify-email';
  static const String vehicles = 'api/v1/vehicles/';
  static const String createVehicle = 'api/v1/vehicles/create';
  static const String vehiclesBrands = 'api/v1/carbrands';
  static const String getReportsList = '/api/v1/reports';
  static const String postReportsList = '/api/v1/reports';
  static const String ads = 'api/v1/ads/';

  static const String getRoadService = '/api/v1/road-services';
  static const String rides  = 'api/v1/rides/';
  static const String createRide  = 'api/v1/rides/';




  static const String resetPassword = 'api/v1/users/reset-password';
  static const String verifyResetPassword = 'api/v1/users/verify-reset-password';
  static const String profile = 'api/v1/profile';
  static const String updateProfile  = 'api/v1/profile';
  static const String favAds  = 'api/v1/users/favoriteAds';
  static const String unfavoritize  = 'api/v1/ads/rF9mr3UyVo/unfavoritize';
  static const String favoritize  = 'api/v1/ads/rF9mr3UyVo/favoritize';
  static const String diaries  = 'api/v1/diary';
  static const String createDiary  = 'api/v1/diary';
  static const String bookings  = 'api/v1/bookings/client';
  static const String countries  = 'api/v1/countries';
  static const String carBrand  = 'api/v1/carbrands';
  static const String getNotification = 'api/v1/notifications';
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String sessionExpiry = StringManager.sessionExpiredPleaseLogin;
  static const String timeoutError = StringManager.noInternetPleaseTryAgain;
  static const String defaultError = StringManager.noInternetPleaseTryAgain;
  static const String cacheError = "cacheError";
  static const String noInternetError = StringManager.noInternetPleaseTryAgain;
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}