import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:roadapp/core/helpers/string_manager.dart';

Future<Response?> handleRequest(
    Future<Response?> Function() request,
    ) async {
  if (!await InternetConnectionChecker().hasConnection) {
    throw DioException(
      requestOptions: RequestOptions(path: ''), // Empty path for no internet
      error: StringManager.noInternetConnection,
    );
  }

  try {
    Response? response = await request();
    if (kDebugMode) {
      print('STATUS CODE IS ${response?.statusCode}');
      print('STATUS MESSAGE IS ${response?.statusMessage}');
      print('SENT DATA IS ${response?.requestOptions.data}');
    }
    return response;
  } on DioException catch (e) {
    if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout) {
      if (kDebugMode) {
        print('DIO TIMEOUT ERROR IS $e');
      }
      throw DioException(
        requestOptions: e.requestOptions,
        error: StringManager.noInternetConnection,
      );
    }
    if (kDebugMode) {
      print('DIO ERROR IS $e');
    }
    return e.response;
  }
}
