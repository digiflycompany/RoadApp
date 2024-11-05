import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:roadapp/core/networking/api_service.dart';
import 'package:roadapp/core/networking/dio_factory.dart';
import 'package:roadapp/features/auth/data/repos/auth_repo.dart';
import 'package:roadapp/features/maintenance%20_report/data/repo/report_repo.dart';
import 'package:roadapp/features/password_recovery/data/repo/recovery_repo.dart';
import 'package:roadapp/features/vehicles/data/repo/vehicles_repo.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {


  ///////////////////////////////////////Example of DI
  Dio dio = DioFactory.getDio();


  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  getIt.registerSingleton<AuthRepo>(
    AuthRepo(ApiService(dio))
  );

  getIt.registerSingleton<RecoveryRepo>(
      RecoveryRepo(ApiService(dio))
  );

  getIt.registerSingleton<VehiclesRepo>(
      VehiclesRepo(ApiService(dio))
  );

  getIt.registerSingleton<ReportRepo>(
      ReportRepo(ApiService(dio))
  );
  // getIt.registerSingleton<AuthRepositoryImplementation>(
  //   AuthRepositoryImplementation(
  //     apiService: getIt.get<ApiService>(),
  //   ),
  // );
}
