import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/localization/locale_cubit/locale_cubit.dart';
import 'package:roadapp/features/account/presentation/manager/account_cubit.dart';
import 'package:roadapp/features/auth/presentation/manager/auth_cubit.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_cubit.dart';
import 'package:roadapp/features/calender/cubit/add_memo_cubit.dart';
import 'package:roadapp/features/calender/cubit/cubit.dart';
import 'package:roadapp/features/fuel_consuming_rate/cubit/cubit.dart';
import 'package:roadapp/features/home/cubit/home_cubit.dart';
import 'package:roadapp/features/layout/cubit/applayout_cubit.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/cubit.dart';
import 'package:roadapp/features/messages/presentation/manager/chat_cubit.dart';
import 'package:roadapp/features/password_recovery/cubit/password_recovery_cubit.dart';
import 'package:roadapp/features/profile/cubit/cubit.dart';
import 'package:roadapp/features/reserve_appointment/cubit/reserve_appointment_cubit.dart';

List<BlocProvider> appBlocProviders() => [
      BlocProvider<ReserveAppointmentCubit>(
          create: (context) => ReserveAppointmentCubit()),
      BlocProvider<LocaleCubit>(
          create: (context) => LocaleCubit()..getSavedLanguage()),
      BlocProvider<AppLayoutCubit>(create: (context) => AppLayoutCubit()),
      BlocProvider<HomeCubit>(create: (context) => HomeCubit()),
      BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
      BlocProvider<PasswordRecoveryCubit>(
          create: (context) => PasswordRecoveryCubit()),
      BlocProvider<AccountCubit>(create: (context) => AccountCubit()),
      BlocProvider<ChatCubit>(create: (context) => ChatCubit()),
      BlocProvider<FuelConsumingRateCubit>(create: (context) => FuelConsumingRateCubit()),
      BlocProvider<MaintenanceReportCubit>(create: (context) => MaintenanceReportCubit()),
      BlocProvider<ProfileCubit>(create: (context) => ProfileCubit()),
      BlocProvider<BusinessModelsCubit>(create: (context) => BusinessModelsCubit()),
      BlocProvider<AddMemoCubit>(create: (context) => AddMemoCubit()),
      BlocProvider<CalendarCubit>(create: (context) => CalendarCubit())
      // Add more providers as needed
    ];