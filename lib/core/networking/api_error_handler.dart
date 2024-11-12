import 'package:dio/dio.dart';
import 'api_constants.dart';
import 'api_error_model.dart';

enum DataSource {
  noContent,
  badRequest,
  forbidden,
  unauthorized,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  defaultError,
  sessionExpiry
}

class ResponseCode {
  static const int success = 200;
  static const int noContent = 201;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int internalServerError = 500;
  static const int notFound = 404;
  static const int apiLogicError = 422;

  // local status code
  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int defaultError = -7;
  static const int sessionExpiry = -8;
}

class ResponseMessage {
  static const String noContent = ApiErrors.noContent; // success with no data (no content)
  static const String badRequest = ApiErrors.badRequestError; // failure, API rejected request
  static const String unauthorized = ApiErrors.unauthorizedError; // failure, user is not authorized
  static const String forbidden = ApiErrors.forbiddenError; // failure, API rejected request
  static const String internalServerError = ApiErrors.internalServerError; // failure, server error
  static const String notFound = ApiErrors.notFoundError; // failure, resource not found

  // local status code messages
  static String connectTimeout = ApiErrors.timeoutError;
  static String sessionExpiry = ApiErrors.sessionExpiry;
  static String cancel = ApiErrors.defaultError;
  static String receiveTimeout = ApiErrors.timeoutError;
  static String sendTimeout = ApiErrors.timeoutError;
  static String cacheError = ApiErrors.cacheError;
  static String noInternetConnection = ApiErrors.noInternetError;
  static String defaultError = ApiErrors.defaultError;
}

extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() {
    switch (this) {
      case DataSource.noContent:
        return ApiErrorModel(message: ResponseMessage.noContent);
      case DataSource.badRequest:
        return ApiErrorModel(message: ResponseMessage.badRequest);
      case DataSource.forbidden:
        return ApiErrorModel(message: ResponseMessage.forbidden);
      case DataSource.unauthorized:
        return ApiErrorModel(message: ResponseMessage.unauthorized);
      case DataSource.notFound:
        return ApiErrorModel(message: ResponseMessage.notFound);
      case DataSource.internalServerError:
        return ApiErrorModel(message: ResponseMessage.internalServerError);
      case DataSource.connectTimeout:
        return ApiErrorModel(message: ResponseMessage.connectTimeout);
      case DataSource.sessionExpiry:
        return ApiErrorModel(message: ResponseMessage.sessionExpiry);
      case DataSource.cancel:
        return ApiErrorModel(message: ResponseMessage.cancel);
      case DataSource.receiveTimeout:
        return ApiErrorModel(message: ResponseMessage.receiveTimeout);
      case DataSource.sendTimeout:
        return ApiErrorModel(message: ResponseMessage.sendTimeout);
      case DataSource.cacheError:
        return ApiErrorModel(message: ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return ApiErrorModel(message: ResponseMessage.noInternetConnection);
      case DataSource.defaultError:
        return ApiErrorModel(message: ResponseMessage.defaultError);
    }
  }
}

class ErrorHandler implements Exception {
  late ApiErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      apiErrorModel = _handleError(error);
    } else {
      apiErrorModel = DataSource.defaultError.getFailure();
    }
  }
}

ApiErrorModel _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectTimeout.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeout.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeout.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null && error.response?.statusCode != null && error.response?.statusMessage != null) {
        if (error.response?.data != null &&
            error.response?.data['message'] == 'jwt expired') {
            return DataSource.sessionExpiry.getFailure();
          }

        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.defaultError.getFailure();
      }
    case DioExceptionType.unknown:
      if (error.response != null && error.response?.statusCode != null && error.response?.statusMessage != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.defaultError.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.defaultError.getFailure();
    case DioExceptionType.badCertificate:
      return DataSource.defaultError.getFailure();
  }
}

class ApiInternalStatus {
  static const int success = 0;
  static const int failure = 1;
}
