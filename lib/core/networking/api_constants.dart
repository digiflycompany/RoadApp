
import 'package:roadapp/core/helpers/string_manager.dart';

class ApiConstants {
  static const String baseUrl = "https://roadapp-api.vercel.app/";
  static const String login = 'api/v1/users/login';
  static const String clientSignUp = 'api/v1/users/client/signup';
  static const String providerSignUp = 'api/v1/users/provider/signup';
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
  static const String timeoutError = StringManager.noInternetPleaseTryAgain;
  static const String defaultError = StringManager.noInternetPleaseTryAgain;
  static const String cacheError = "cacheError";
  static const String noInternetError = StringManager.noInternetPleaseTryAgain;
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}