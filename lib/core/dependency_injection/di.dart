import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:roadapp/core/networking/api_service.dart';
import 'package:roadapp/core/networking/dio_factory.dart';
import 'package:roadapp/features/auth/data/repos/auth_repo.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {


  ///////////////////////////////////////Example of DI
  Dio dio = DioFactory.getDio();


  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  getIt.registerSingleton<AuthRepo>(
    AuthRepo(ApiService(dio))
  );

  // getIt.registerSingleton<AuthRepositoryImplementation>(
  //   AuthRepositoryImplementation(
  //     apiService: getIt.get<ApiService>(),
  //   ),
  // );
}
