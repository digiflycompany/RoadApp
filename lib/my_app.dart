import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/app_theme.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_helper.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_vars.dart';
import 'package:roadapp/core/helpers/localization/locale_cubit/locale_cubit.dart';
import 'package:roadapp/core/helpers/logger.dart';
import 'package:roadapp/core/helpers/state_managment/app_bloc_providers.dart';
import 'package:roadapp/features/layout/presentation/views/screens/app_layout.dart';
import 'package:roadapp/features/password_recovery/presentation/views/screens/verification_screen.dart';
import 'package:roadapp/features/service_country/presentation/views/screens/service_country_screen.dart';
import 'package:roadapp/features/splash/views/screens/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? getToken() {
    String? token = CacheHelper().getData(CacheVars.accessToken);
    DefaultLogger.logger.i('Token: $token');
    return token;
  }

  bool? isVerified() {
    bool? verified = CacheHelper().getData(CacheVars.isVerified);
    return verified;
  }

  bool? haveCountry() {
    bool? haveCountry = CacheHelper().getData(CacheVars.userCountry);
    return haveCountry;
  }

  late bool token, verified, country;

  @override
  void initState() {
    token = getToken() != null;
    verified = isVerified() ?? false;
    country = haveCountry() ?? false;
    super.initState();
  }

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
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate
                    ],
                    supportedLocales: const [Locale("ar"), Locale("en")],
                    builder: DevicePreview.appBuilder,
                    home: token
                        ? (verified
                            ? (country
                                ? const AppLayout()
                                : const ServiceCountryScreen())
                            : const VerificationScreen(justRegistered: true))
                        : const SplashScreen());
              }));
        });
  }
}