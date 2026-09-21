import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:restart_app/restart_app.dart';
import 'package:roadapp/app/my_app.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_helper.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_vars.dart';
import 'package:flutter_alice/alice.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioInterceptor();
    }
    return dio!;
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers['Authorization'] = 'Bearer $token';
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(InterceptorsWrapper(
        onError: (DioException error, ErrorInterceptorHandler handler) async {
      if (_isTokenExpired(error)) {
        await _handleLogout();
      }
      return handler.next(error);
    }));

    dio?.interceptors.add(PrettyDioLogger(
        requestBody: true, requestHeader: true, responseHeader: true));

    if (kReleaseMode) {
      final alice = Alice(navigatorKey: navigatorKey);
      dio?.interceptors.add(alice.getDioInterceptor());
    }
  }

  static bool _isTokenExpired(DioException error) {
    final responseData = error.response?.data;

    if (responseData is Map<String, dynamic>) {
      if (responseData['message'] == 'jwt expired' ||
          responseData['message']
                  ?.toString()
                  .toLowerCase()
                  .contains('jwt expired') ==
              true) {
        return true;
      }
    }

    if (error.response?.statusCode == 401) {
      return true;
    }

    return false;
  }

  static Future<void> _handleLogout() async {
    await CacheHelper().removeData(CacheVars.accessToken);
    await CacheHelper().removeData('MaintenanceCenterProfileIdKey');
    await CacheHelper().removeData('CLIENT');
    await CacheHelper().removeData('profileImageUrl');

    dio?.options.headers.remove('Authorization');

    await Restart.restartApp(
        mode:
            Platform.isIOS ? RestartMode.platformDefault : RestartMode.process,
        forceKill: Platform.isIOS ? false : true);
  }

  static void resetDio() {
    dio = null;
  }
}
