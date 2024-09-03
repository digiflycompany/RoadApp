import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/localization/locale_cubit/locale_cubit.dart';
import 'package:roadapp/features/auth/presentation/manager/auth_cubit.dart';
import 'package:roadapp/features/home/cubit/home_cubit.dart';
import 'package:roadapp/features/layout/cubit/applayout_cubit.dart';
import 'package:roadapp/features/reserve_appointment/cubit/reserve_appointment_cubit.dart';

List<BlocProvider> appBlocProviders() => [
    BlocProvider<ReserveAppointmentCubit>(
        create: (context) => ReserveAppointmentCubit()),
    BlocProvider<LocaleCubit>(
        create: (context) => LocaleCubit()..getSavedLanguage()
    ),
    BlocProvider<AppLayoutCubit>(
        create: (context) => AppLayoutCubit()),
    BlocProvider<HomeCubit>(create: (context) => HomeCubit()),
    BlocProvider<AuthCubit>(create: (context) => AuthCubit())
      // Add more providers as needed
    ];
