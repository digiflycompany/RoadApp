import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/dependency_injection/di.dart';
import 'package:roadapp/core/helpers/localization/locale_cubit/locale_cubit.dart';
import 'package:roadapp/features/accessories_centers/presentation/manager/accessories_cubit.dart';
import 'package:roadapp/features/account/data/repo/account_repo.dart';
import 'package:roadapp/features/account/presentation/manager/account_cubit.dart';
import 'package:roadapp/features/addAds/data/repo/ads_repo.dart';
import 'package:roadapp/features/addAds/presentation/cubit/ads_cubit.dart';
import 'package:roadapp/features/auth/data/repos/auth_repo.dart';
import 'package:roadapp/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_cubit.dart';
import 'package:roadapp/features/calendar/data/repos/memos_repo.dart';
import 'package:roadapp/features/calendar/presentation/cubit/add_memo/add_memo_cubit.dart';
import 'package:roadapp/features/calendar/presentation/cubit/cubit.dart';
import 'package:roadapp/features/general_inventory/data/repos/get_general_stock_repo.dart';
import 'package:roadapp/features/general_inventory/presentation/manager/inventory_cubit.dart';
import 'package:roadapp/features/home/data/repos/home_repo.dart';
import 'package:roadapp/features/home/presentation/cubit/home_cubit.dart';
import 'package:roadapp/features/layout/presentation/cubit/applayout_cubit.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/cubit.dart';
import 'package:roadapp/features/maintenance%20_report/data/repo/report_repo.dart';
import 'package:roadapp/features/maintenance_centers/presentation/cubit/maintenance_cubit.dart';
import 'package:roadapp/features/maintenance_service/data/repo/maintenance_service_type_repo.dart';
import 'package:roadapp/features/messages/presentation/manager/chat_cubit.dart';
import 'package:roadapp/features/oils_and_consumables_centers/presentation/manager/oils_cubit.dart';
import 'package:roadapp/features/password_recovery/data/repo/recovery_repo.dart';
import 'package:roadapp/features/password_recovery/presentation/cubit/password_recovery_cubit.dart';
import 'package:roadapp/features/profile/cubit/cubit.dart';
import 'package:roadapp/features/reserve_appointment/data/repos/reservations_repo.dart';
import 'package:roadapp/features/reserve_appointment/presentation/cubit/reserve_appointment_cubit.dart';
import 'package:roadapp/features/spare_parts/cubit/spare_parts_type_cubit.dart';
import 'package:roadapp/features/spare_parts/data/repo/spare_parts_type_repo.dart';
import 'package:roadapp/features/spare_parts_centers/presentation/data/repo/spare_parts_center_repo.dart';
import 'package:roadapp/features/spare_parts_centers/presentation/manager/spare_parts_cubit.dart';
import 'package:roadapp/features/vehicles/data/repos/vehicles_repo.dart';
import 'package:roadapp/features/vehicles/presentation/cubit/vehicles_cubit.dart';
import 'package:roadapp/features/vendor_reservations_management/data/repos/reservation_managment_repo.dart';
import 'package:roadapp/features/vendor_reservations_management/presentation/cubit/reservations_management_cubit.dart';
import 'package:roadapp/features/work_reports/data/repo/work_reports_repo.dart';
import 'package:roadapp/features/work_reports/presentation/cubit/work_reports_cubit.dart';

import '../../../features/business_models/data/repo/business_models_repo.dart';
import '../../../features/maintenance_centers/data/repo/maintenance_center_repo.dart';
import '../../../features/maintenance_service/cubit/maintenance_service_type_cubit.dart';
import '../../../features/privacyPolicy/cubit/privacy_policy_cubit.dart';
import '../../../features/privacyPolicy/data/repo/privacy_policy_repo.dart';
import '../../../features/products_guide/data/repo/products_basket_repo.dart';
import '../../../features/products_guide/views/cubit/product_basket_cubit.dart';
import '../../../features/services_guide/data/repo/maintenance_service_type_repo.dart';
import '../../../features/services_guide/views/cubit/maintenance_service_type_cubit.dart';

List<BlocProvider> appBlocProviders() => [
      BlocProvider<ReserveAppointmentCubit>(
          create: (context) => ReserveAppointmentCubit(getIt.get<ReservationsRepo>(),context)),
      BlocProvider<LocaleCubit>(
          create: (context) => LocaleCubit()..getSavedLanguage()),
      BlocProvider<AppLayoutCubit>(create: (context) => AppLayoutCubit()),
      BlocProvider<HomeCubit>(create: (context) => HomeCubit(getIt.get<HomeRepo>())..getUserCountry()..fetchAds(page: 1)),
      BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(getIt.get<AuthRepo>())),
      BlocProvider<PasswordRecoveryCubit>(
          create: (context) =>
              PasswordRecoveryCubit(getIt.get<RecoveryRepo>())),
      BlocProvider<VehiclesCubit>(
          create: (context) => VehiclesCubit(getIt.get<VehiclesRepo>())..fetchVehicles()),
      BlocProvider<AccountCubit>(create: (context) => AccountCubit(getIt.get<AccountRepo>())..fetchAccount()),
      BlocProvider<ChatCubit>(create: (context) => ChatCubit()),
      BlocProvider<MaintenanceReportCubit>(
          create: (context) => MaintenanceReportCubit(getIt.get<ReportRepo>())),
      BlocProvider<ProfileCubit>(create: (context) => ProfileCubit()),
      BlocProvider<BusinessModelsCubit>(
          create: (context) => BusinessModelsCubit(getIt.get<BusinessModelsRepo>())),
      BlocProvider<AddMemoCubit>(create: (context) => AddMemoCubit(getIt.get<MemosRepo>())),
      BlocProvider<InventoryCubit>(create: (context) => InventoryCubit(getIt.get<GetGeneralStockRepo>())..getInventoryRecord()),
      BlocProvider<AccessoriesCubit>(create: (context) => AccessoriesCubit()),
      BlocProvider<MaintenanceCubit>(create: (context) => MaintenanceCubit( getIt.get<MaintenanceCenterRepo>())),
      BlocProvider<SparePartsCubit>(create: (context) => SparePartsCubit(getIt.get<SparePartsCenterRepo>())),
      BlocProvider<OilsCubit>(create: (context) => OilsCubit()),
      BlocProvider<MaintenanceServiceTypeCubit>(create: (context) => MaintenanceServiceTypeCubit(getIt.get<MaintenanceServiceTypeRepo>())),
      BlocProvider<CalendarCubit>(create: (context) => CalendarCubit(getIt.get<MemosRepo>())),
      BlocProvider<SparePartsTypeCubit>(create: (context) => SparePartsTypeCubit(getIt.get<SparePartsTypeRepo>())),
      BlocProvider<WorkReportsCubit>(create: (context) => WorkReportsCubit(getIt.get<WorkReportsRepo>())..fetchWorkReports()),
      BlocProvider<ReservationManagementCubit>(create: (context) => ReservationManagementCubit(getIt.get<ReservationManagementRepo>())..getReservationManagementData('PENDING')),
      BlocProvider<MaintenanceServiceTypeVendorCubit>(create: (context) => MaintenanceServiceTypeVendorCubit(getIt.get<MaintenanceServiceTypeVendorRepo>())),
      BlocProvider<ProductBasketCubit>(create: (context) => ProductBasketCubit(getIt.get<ProductsBasketRepo>())),
      BlocProvider<AdsCubit>(create: (context) => AdsCubit(getIt.get<AdsRepo>())),
      BlocProvider<PrivacyPolicyCubit>(create: (context) => PrivacyPolicyCubit(getIt.get<PrivacyPolicyRepo>())),
      // Add more providers as needed
    ];