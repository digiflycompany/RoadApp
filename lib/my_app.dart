import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/app_theme.dart';
import 'package:roadapp/core/localization/locale_cubit/locale_cubit.dart';
import 'package:roadapp/core/state_managment/app_bloc_providers.dart';
import 'package:roadapp/features/splash/views/screens/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:roadapp/core/Localization/app_localization.dart';

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
              providers: appBlocProviders(),
              child: BlocBuilder<LocaleCubit, LocaleState>(
                  builder: (context, state) {
                return MaterialApp(
                    navigatorKey: navigatorKey,
                    theme: AppThemes.whiteTheme,
                    debugShowCheckedModeBanner: false,
                    title: 'Road App',
                    locale: state is ChangeLocaleState ? state.locale : null,
                    localizationsDelegates: const [
                      AppLocalizations
                          .delegate, // Your app localization delegate
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate
                    ],
                    supportedLocales: const [Locale("ar"), Locale("en")],
                    builder: DevicePreview.appBuilder,
                    home: const SplashScreen());
              }));
        });
  }
}