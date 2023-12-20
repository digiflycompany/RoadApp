import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/layout/cubit/applayout_cubit.dart';
import 'package:roadapp2/modules/home/cubit/home_cubit.dart';
import 'package:roadapp2/services/shared_preferences/preferences_helper.dart';
import 'package:roadapp2/shared/themes/app_theme.dart';

import 'modules/reserve_appointment/cubit/reserve_appointment_cubit.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      useInheritedMediaQuery: true,
      builder: (BuildContext context, Widget? _) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AppointmentCubit>(create: (context) => AppointmentCubit()),
            BlocProvider<AppLayoutCubit>(create: (context) => AppLayoutCubit()),
            BlocProvider<HomeCubit>(create: (context) => HomeCubit()),
          ],
          child: MaterialApp(
            navigatorKey: navigatorKey,
            theme: AppThemes.whiteTheme,
            debugShowCheckedModeBanner: false,
            title: 'roadapp2',
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: PreferencesHelper.applicationFirstPage,
          ),
        );
      },
    );
  }
}