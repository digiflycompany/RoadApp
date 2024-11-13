import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:roadapp/core/networking/api_service.dart';
import 'package:roadapp/core/networking/dio_factory.dart';
import 'package:roadapp/features/account/data/repo/account_repo.dart';
import 'package:roadapp/features/auth/data/repos/auth_repo.dart';
import 'package:roadapp/features/calendar/data/repos/memos_repo.dart';
import 'package:roadapp/features/favorite/data/repos/fav_repo.dart';
import 'package:roadapp/features/maintenance%20_report/data/repo/report_repo.dart';
import 'package:roadapp/features/notification/data/repo/notification_repo.dart';
import 'package:roadapp/features/password_recovery/data/repo/recovery_repo.dart';
import 'package:roadapp/features/reserve_appointment/data/repos/reservations_repo.dart';
import 'package:roadapp/features/road_services/data/repo/road_service_repo.dart';
import 'package:roadapp/features/vehicles/data/repos/vehicles_repo.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  ///////////////////////////////////////Example of DI
  Dio dio = DioFactory.getDio();

  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  getIt.registerSingleton<AuthRepo>(AuthRepo(ApiService(dio)));

  getIt.registerSingleton<RecoveryRepo>(RecoveryRepo(ApiService(dio)));

  getIt.registerSingleton<VehiclesRepo>(VehiclesRepo(ApiService(dio)));

  getIt.registerSingleton<AccountRepo>(AccountRepo(ApiService(dio)));

  getIt.registerSingleton<FavRepo>(FavRepo(ApiService(dio)));

  getIt.registerSingleton<MemosRepo>(MemosRepo(ApiService(dio)));

  getIt.registerSingleton<ReportRepo>(ReportRepo(ApiService(dio)));
  getIt.registerSingleton<NotificationRepo>(
      NotificationRepo(ApiService(dio))
  );

  // getIt.registerSingleton<AuthRepositoryImplementation>(
  //   AuthRepositoryImplementation(
  //     apiService: getIt.get<ApiService>(),
  //   ),
  // );

  getIt.registerSingleton<ReservationsRepo>(ReservationsRepo(ApiService(dio)));

  getIt.registerSingleton<RoadServiceRepo>(RoadServiceRepo(ApiService(dio)));
}