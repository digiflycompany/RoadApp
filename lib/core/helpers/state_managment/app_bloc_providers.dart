import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/dependency_injection/di.dart';
import 'package:roadapp/core/helpers/localization/locale_cubit/locale_cubit.dart';
import 'package:roadapp/features/accessories_centers/presentation/manager/accessories_cubit.dart';
import 'package:roadapp/features/account/data/repo/account_repo.dart';
import 'package:roadapp/features/account/presentation/manager/account_cubit.dart';
import 'package:roadapp/features/auth/data/repos/auth_repo.dart';
import 'package:roadapp/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_cubit.dart';
import 'package:roadapp/features/calendar/data/repos/memos_repo.dart';
import 'package:roadapp/features/calendar/presentation/cubit/add_memo/add_memo_cubit.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/cubit/cubit.dart';
import 'package:roadapp/features/general_inventory/presentation/manager/inventory_cubit.dart';
import 'package:roadapp/features/home/presentation/cubit/home_cubit.dart';
import 'package:roadapp/features/layout/presentation/cubit/applayout_cubit.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/cubit.dart';
import 'package:roadapp/features/maintenance%20_report/data/repo/report_repo.dart';
import 'package:roadapp/features/maintenance_centers/presentation/manager/maintenance_cubit.dart';
import 'package:roadapp/features/messages/presentation/manager/chat_cubit.dart';
import 'package:roadapp/features/oils_and_consumables_centers/presentation/manager/oils_cubit.dart';
import 'package:roadapp/features/password_recovery/data/repo/recovery_repo.dart';
import 'package:roadapp/features/password_recovery/presentation/cubit/password_recovery_cubit.dart';
import 'package:roadapp/features/profile/cubit/cubit.dart';
import 'package:roadapp/features/reserve_appointment/data/repos/reservations_repo.dart';
import 'package:roadapp/features/reserve_appointment/presentation/cubit/reserve_appointment_cubit.dart';
import 'package:roadapp/features/spare_parts_centers/presentation/manager/spare_parts_cubit.dart';
import 'package:roadapp/features/vehicles/data/repos/vehicles_repo.dart';
import 'package:roadapp/features/vehicles/presentation/cubit/vehicles_cubit.dart';

List<BlocProvider> appBlocProviders() => [
      BlocProvider<ReserveAppointmentCubit>(
          create: (context) => ReserveAppointmentCubit(getIt.get<ReservationsRepo>())),
      BlocProvider<LocaleCubit>(
          create: (context) => LocaleCubit()..getSavedLanguage()),
      BlocProvider<AppLayoutCubit>(create: (context) => AppLayoutCubit()),
      BlocProvider<HomeCubit>(create: (context) => HomeCubit()),
      BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(getIt.get<AuthRepo>())),
      BlocProvider<PasswordRecoveryCubit>(
          create: (context) =>
              PasswordRecoveryCubit(getIt.get<RecoveryRepo>())),
      BlocProvider<VehiclesCubit>(
          create: (context) => VehiclesCubit(getIt.get<VehiclesRepo>())..fetchVehicles()),
      BlocProvider<AccountCubit>(create: (context) => AccountCubit(getIt.get<AccountRepo>())..fetchAccount()),
      BlocProvider<ChatCubit>(create: (context) => ChatCubit()),
      BlocProvider<FuelConsumingRateCubit>(
          create: (context) => FuelConsumingRateCubit()),
      BlocProvider<MaintenanceReportCubit>(
          create: (context) => MaintenanceReportCubit(getIt.get<ReportRepo>())),
      BlocProvider<ProfileCubit>(create: (context) => ProfileCubit()),
      BlocProvider<BusinessModelsCubit>(
          create: (context) => BusinessModelsCubit()),
      BlocProvider<AddMemoCubit>(create: (context) => AddMemoCubit(getIt.get<MemosRepo>())),
      BlocProvider<InventoryCubit>(create: (context) => InventoryCubit()),
      BlocProvider<AccessoriesCubit>(create: (context) => AccessoriesCubit()),
      BlocProvider<MaintenanceCubit>(create: (context) => MaintenanceCubit()),
      BlocProvider<SparePartsCubit>(create: (context) => SparePartsCubit()),
      BlocProvider<OilsCubit>(create: (context) => OilsCubit())
      // Add more providers as needed
    ];