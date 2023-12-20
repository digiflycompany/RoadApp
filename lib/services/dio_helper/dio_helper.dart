import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:roadapp2/services/shared_preferences/preferences_helper.dart';
import 'package:roadapp2/shared/const/api_consts.dart';

class DioHelper {
  static BaseOptions opts = BaseOptions(
    baseUrl: EndPoints.baseUrl,
    headers: {
      'lang': '${PreferencesHelper.getLang()}',
    },
    receiveDataWhenStatusError: true,
    followRedirects: false,
    validateStatus: (status) {
      return status! <= 500;
    },
  );

  static Dio init() => Dio(opts);

  static Dio? dio = init();

  static Future<Response?> postData(
      {required String url, Map<String, dynamic>? data}) async {
    String? token = PreferencesHelper.getToken();
    try {
      Response? response = await dio?.post(url,
          options: Options(headers: {'Authorization': 'Bearer $token'}),
          data: data);

      if (kDebugMode) {
        print(response);
      }
      return response;
    } catch (e) {
      return e is DioException ? e.response : null;
    }
  }

  static Future<Response?> getData(
      {required String url, Map<String, dynamic>? queryParameters}) async {
    try {
      Response? response =
          await dio?.get(url, queryParameters: queryParameters);

      return response;
    } catch (e) {
      return e is DioException ? e.response : null;
    }
  }

  static Future<Response?> putData(
      {required String url, required Map<String, dynamic> data}) async {
    try {
      Response? response = await dio?.put(url, data: data);
      return response;
    } catch (e) {
      return e is DioException ? e.response : null;
    }
  }
}
