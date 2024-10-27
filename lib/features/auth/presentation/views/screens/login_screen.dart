import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/dependency_injection/di.dart';
import 'package:roadapp/core/helpers/functions/show_default_dialog.dart';
import 'package:roadapp/core/helpers/functions/show_default_loading_indicator.dart';
import 'package:roadapp/core/helpers/logger.dart';
import 'package:roadapp/features/auth/data/repos/login_repo.dart';
import 'package:roadapp/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:roadapp/features/auth/presentation/cubit/auth_state.dart';
import 'package:roadapp/features/auth/presentation/views/widgets/account_type.dart';
import 'package:roadapp/features/auth/presentation/views/widgets/create_account_row.dart';
import 'package:roadapp/features/auth/presentation/views/widgets/forgot_password_row.dart';
import 'package:roadapp/features/auth/presentation/views/widgets/login_background.dart';
import 'package:roadapp/features/auth/presentation/views/widgets/login_button.dart';
import 'package:roadapp/features/auth/presentation/views/widgets/login_inputs.dart';
import 'package:roadapp/core/widgets/auth_logo.dart';
import 'package:roadapp/features/auth/presentation/views/widgets/login_title.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/features/service_sector/views/screens/service_sector_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthCubit(getIt.get<LoginRepo>()),
        child: BlocConsumer<AuthCubit, AuthState>(
            listener: (BuildContext context, AuthState state) {
          if (state is AuthSuccessState) {
            AppNavigation.navigateOffAll(const ServiceSectorScreen());
          }
          if(state is AuthLoadingState) showDefaultLoadingIndicator(context, cancelable: false);
          if(state is AuthErrorState) {
            Navigator.pop(context);
            DefaultLogger.logger.d(state.error);
            showDefaultDialog(context, type: NotificationType.error, description: state.error, title: 'o');
          }
        }, builder: (BuildContext context, AuthState state) {
          var cubit = AuthCubit.get(context);
          return Scaffold(
              body: SafeArea(
                  child: Stack(alignment: Alignment.center, children: [
            const LoginBackground(),
            Container(
                color: AppColors.tertiary,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                height: MediaQuery.of(context).size.height * 0.85,
                width: MediaQuery.of(context).size.width * 0.8,
                child: SingleChildScrollView(
                    child: Form(
                  key: cubit.loginFormKey,
                  child: const Column(children: [
                    AuthLogo(),
                    LoginTitle(),
                    AccountType(),
                    LoginInputs(),
                    ForgotPasswordRow(),
                    LoginButton(),
                    CreateAccountRow()
                  ])
                )))
          ])));
        }));
  }
}