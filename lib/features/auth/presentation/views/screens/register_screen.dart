import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/dependency_injection/di.dart';
import 'package:roadapp/core/helpers/functions/show_default_dialog.dart';
import 'package:roadapp/core/helpers/functions/show_default_loading_indicator.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/logger.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/auth/data/repos/auth_repo.dart';
import 'package:roadapp/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:roadapp/features/auth/presentation/cubit/auth_state.dart';
import 'package:roadapp/core/widgets/auth_logo.dart';
import 'package:roadapp/features/auth/presentation/views/widgets/account_type.dart';
import 'package:roadapp/features/auth/presentation/views/widgets/register_title.dart';
import 'package:roadapp/features/auth/presentation/views/widgets/register_user_type.dart';
import 'package:roadapp/features/auth/presentation/views/widgets/register_background.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/features/service_sector/views/screens/service_sector_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthCubit(getIt.get<AuthRepo>()),
        child: BlocConsumer<AuthCubit, AuthState>(
            listener: (BuildContext context, state) {
          if (state is AuthSuccessState) {
            AppNavigation.navigateOffAll(const ServiceSectorScreen());
          }
          if (state is AuthLoadingState) {
            showDefaultLoadingIndicator(context, cancelable: false);
          }
          if (state is AuthErrorState) {
            Navigator.pop(context);
            DefaultLogger.logger.d(state.error);
            showDefaultDialog(context,
                type: NotificationType.error,
                description: state.error,
                title: StringManager.authError.tr(context));
          }
        }, builder: (BuildContext context, state) {
          var cubit = AuthCubit.get(context);
          return Scaffold(
              body: SafeArea(
                  child: Stack(alignment: Alignment.center, children: [
            const RegisterBackground(),
            SingleChildScrollView(
                child: Container(
                    color: AppColors.tertiary,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    width: MediaQuery.of(context).size.width * 0.80,
                    child: Column(children: [
                      const AuthLogo(),
                      const RegisterTitle(),
                      Gap(14.h),
                      // const AccountType(),
                      const RegisterUserType(),
                      SizedBox(height: 20.h),
                      cubit.infoFieldsList[cubit.selectedRadioValue]
                    ])))
          ])));
        }));
  }
}