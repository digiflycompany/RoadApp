import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
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

      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        maxWidth: 50,
      ),
    );

    // DioCacheInterceptor(
    //   options: CacheOptions(
    //     store: HiveCacheStore(AppPathProvider.path),
    //     policy: CachePolicy.forceCache,
    //     hitCacheOnErrorExcept: [],
    //     maxStale: const Duration(
    //       days: 1,
    //     ),
    //     priority: CachePriority.high,
    //   ),
    // );

    // (dio?.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (HttpClient client) {
    //   client.badCertificateCallback =
    //       (X509Certificate cert, String host, int port) => true;
    //   return client;
    // };
  }

// class AppPathProvider {
//   AppPathProvider._();

//   static String? _path;

//   static String get path {
//     if (_path != null) {
//       return _path!;
//     } else {
//       throw Exception('path not initialized');
//     }
//   }

//   static Future<void> initPath() async {
//     final dir = await pp.getApplicationDocumentsDirectory();
//     _path = dir.path;
//   }
// }
}
