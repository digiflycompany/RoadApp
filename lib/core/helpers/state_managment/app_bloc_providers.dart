import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/dependency_injection/di.dart';
import 'package:roadapp/core/helpers/localization/locale_cubit/locale_cubit.dart';
import 'package:roadapp/features/accessories_centers/presentation/manager/accessories_cubit.dart';
import 'package:roadapp/features/account/presentation/manager/account_cubit.dart';
import 'package:roadapp/features/auth/data/repos/login_repo.dart';
import 'package:roadapp/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_cubit.dart';
import 'package:roadapp/features/calendar/presentation/cubit/add_memo/add_memo_cubit.dart';
import 'package:roadapp/features/calendar/presentation/cubit/cubit.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/cubit/cubit.dart';
import 'package:roadapp/features/general_inventory/presentation/manager/inventory_cubit.dart';
import 'package:roadapp/features/home/presentation/cubit/home_cubit.dart';
import 'package:roadapp/features/layout/presentation/cubit/applayout_cubit.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/cubit.dart';
import 'package:roadapp/features/maintenance_centers/presentation/manager/maintenance_cubit.dart';
import 'package:roadapp/features/messages/presentation/manager/chat_cubit.dart';
import 'package:roadapp/features/oils_and_consumables_centers/presentation/manager/oils_cubit.dart';
import 'package:roadapp/features/password_recovery/cubit/password_recovery_cubit.dart';
import 'package:roadapp/features/profile/cubit/cubit.dart';
import 'package:roadapp/features/reserve_appointment/cubit/reserve_appointment_cubit.dart';
import 'package:roadapp/features/spare_parts_centers/presentation/manager/spare_parts_cubit.dart';

List<BlocProvider> appBlocProviders() => [
      BlocProvider<ReserveAppointmentCubit>(
          create: (context) => ReserveAppointmentCubit()),
      BlocProvider<LocaleCubit>(
          create: (context) => LocaleCubit()..getSavedLanguage()),
      BlocProvider<AppLayoutCubit>(create: (context) => AppLayoutCubit()),
      BlocProvider<HomeCubit>(create: (context) => HomeCubit()),
      BlocProvider<AuthCubit>(create: (context) => AuthCubit(getIt.get<LoginRepo>())),
      BlocProvider<PasswordRecoveryCubit>(
          create: (context) => PasswordRecoveryCubit()),
      BlocProvider<AccountCubit>(create: (context) => AccountCubit()),
      BlocProvider<ChatCubit>(create: (context) => ChatCubit()),
      BlocProvider<FuelConsumingRateCubit>(
          create: (context) => FuelConsumingRateCubit()),
      BlocProvider<MaintenanceReportCubit>(
          create: (context) => MaintenanceReportCubit()),
      BlocProvider<ProfileCubit>(create: (context) => ProfileCubit()),
      BlocProvider<BusinessModelsCubit>(
          create: (context) => BusinessModelsCubit()),
      BlocProvider<AddMemoCubit>(create: (context) => AddMemoCubit()),
      BlocProvider<CalendarCubit>(create: (context) => CalendarCubit()),
      BlocProvider<InventoryCubit>(create: (context) => InventoryCubit()),
      BlocProvider<AccessoriesCubit>(create: (context) => AccessoriesCubit()),
      BlocProvider<MaintenanceCubit>(create: (context) => MaintenanceCubit()),
      BlocProvider<SparePartsCubit>(create: (context) => SparePartsCubit()),
      BlocProvider<OilsCubit>(create: (context) => OilsCubit())
      // Add more providers as needed
    ];