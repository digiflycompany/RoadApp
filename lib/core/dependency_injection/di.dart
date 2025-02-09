import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:roadapp/core/networking/api_service.dart';
import 'package:roadapp/core/networking/dio_factory.dart';
import 'package:roadapp/features/account/data/repo/account_repo.dart';
import 'package:roadapp/features/addAds/data/repo/ads_repo.dart';
import 'package:roadapp/features/auth/data/repos/auth_repo.dart';
import 'package:roadapp/features/calendar/data/repos/memos_repo.dart';
import 'package:roadapp/features/clients/data/repo/customers_report_repo.dart';
import 'package:roadapp/features/favorite/data/repos/fav_repo.dart';
import 'package:roadapp/features/fuel_consuming_rate/data/repos/fuel_rates_repo.dart';
import 'package:roadapp/features/general_inventory/data/repos/get_general_stock_repo.dart';
import 'package:roadapp/features/home/data/repos/home_repo.dart';
import 'package:roadapp/features/maintenance%20_report/data/repo/report_repo.dart';
import 'package:roadapp/features/maintenance_center_details/data/repo/poking_product_repo.dart';
import 'package:roadapp/features/notification/data/repo/notification_repo.dart';
import 'package:roadapp/features/password_recovery/data/repo/recovery_repo.dart';
import 'package:roadapp/features/reserve_appointment/data/repos/reservations_repo.dart';
import 'package:roadapp/features/road_services/data/repo/road_service_repo.dart';
import 'package:roadapp/features/search/data/repo/search_repo.dart';
import 'package:roadapp/features/spare_parts_center_details/data/repo/spare_parts_center_details_repo.dart';
import 'package:roadapp/features/spare_parts_centers/presentation/data/repo/spare_parts_center_repo.dart';
import 'package:roadapp/features/vehicles/data/repos/vehicles_repo.dart';

import '../../features/business_models/data/repo/business_models_repo.dart';
import '../../features/contact_us/data/repo/contact_us_repo.dart';
import '../../features/maintenance_centers/data/repo/maintenance_center_repo.dart';
import '../../features/maintenance_service/data/repo/maintenance_service_type_repo.dart';
import '../../features/products_guide/data/repo/products_basket_repo.dart';
import '../../features/services_guide/data/repo/maintenance_service_type_repo.dart';
import '../../features/spare_parts/data/repo/spare_parts_type_repo.dart';
import '../../features/vendor_reservations_management/data/repos/reservation_managment_repo.dart';
import '../../features/work_reports/data/repo/work_reports_repo.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerSingleton<AuthRepo>(AuthRepo(ApiService(dio)));
  getIt.registerSingleton<RecoveryRepo>(RecoveryRepo(ApiService(dio)));
  getIt.registerSingleton<VehiclesRepo>(VehiclesRepo(ApiService(dio)));
  getIt.registerSingleton<AccountRepo>(AccountRepo(ApiService(dio)));
  getIt.registerSingleton<FavRepo>(FavRepo(ApiService(dio)));
  getIt.registerSingleton<MemosRepo>(MemosRepo(ApiService(dio)));
  getIt.registerSingleton<ReportRepo>(ReportRepo(ApiService(dio)));
  getIt.registerSingleton<NotificationRepo>(NotificationRepo(ApiService(dio)));
  getIt.registerSingleton<ReservationsRepo>(ReservationsRepo(ApiService(dio)));
  getIt.registerSingleton<FuelRatesRepo>(FuelRatesRepo(ApiService(dio)));
  getIt.registerSingleton<SearchRepo>(SearchRepo(ApiService(dio)));
  getIt.registerSingleton<HomeRepo>(HomeRepo(ApiService(dio)));

  getIt.registerSingleton<MaintenanceServiceTypeRepo>(MaintenanceServiceTypeRepo(ApiService(dio)));

  getIt.registerSingleton<MaintenanceCenterRepo>(MaintenanceCenterRepo(ApiService(dio)));
  getIt.registerSingleton<BookingProductRepo>(BookingProductRepo(ApiService(dio)));
  getIt.registerSingleton<RoadServiceRepo>(RoadServiceRepo(ApiService(dio)));
  getIt.registerSingleton<SparePartsTypeRepo>(SparePartsTypeRepo(ApiService(dio)));
  getIt.registerSingleton<SparePartsCenterRepo>(SparePartsCenterRepo(ApiService(dio)));
  getIt.registerSingleton<SparePartsCenterDetailsRepo>(SparePartsCenterDetailsRepo(ApiService(dio)));
  getIt.registerSingleton<BusinessModelsRepo>(BusinessModelsRepo(ApiService(dio)));
  getIt.registerSingleton<WorkReportsRepo>(WorkReportsRepo(ApiService(dio)));
  getIt.registerSingleton<ReservationManagementRepo>(ReservationManagementRepo(ApiService(dio)));
  getIt.registerSingleton<CustomersReportRepo>(CustomersReportRepo(ApiService(dio)));
  getIt.registerSingleton<MaintenanceServiceTypeVendorRepo>(MaintenanceServiceTypeVendorRepo(ApiService(dio)));
  getIt.registerSingleton<ProductsBasketRepo>(ProductsBasketRepo(ApiService(dio)));
  getIt.registerSingleton<GetGeneralStockRepo>(GetGeneralStockRepo(ApiService(dio)));
  getIt.registerSingleton<AdsRepo>(AdsRepo(ApiService(dio)));
  getIt.registerSingleton<ContactUsRepo>(ContactUsRepo(ApiService(dio)));
}