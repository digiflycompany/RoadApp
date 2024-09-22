import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:roadapp/core/api/dio_helper/dio_factory.dart';
import 'package:roadapp/core/api/dio_helper/dio_helper.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  Dio dio = DioFactory.getDio();

  getIt.registerSingleton<DioHelper>(DioHelper(dio));

  ///////////////////////////////////////Example of DI

  // getIt.registerSingleton<AuthRepositoryImplementation>(
  //   AuthRepositoryImplementation(
  //     apiService: getIt.get<ApiService>(),
  //   ),
  // );
}
