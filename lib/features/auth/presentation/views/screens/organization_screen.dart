import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/features/auth/presentation/manager/auth_cubit.dart';
import 'package:roadapp/features/auth/presentation/manager/auth_state.dart';
import 'package:roadapp/features/auth/presentation/views/screens/login_screen.dart';
import 'package:roadapp/core/navigation/navigation.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/features/auth/presentation/views/widgets/organization_registration_fields.dart';
import 'package:roadapp/features/layout/presentation/views/screens/app_layout.dart';

class OrganizationScreen extends StatelessWidget {
  const OrganizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
        builder: (BuildContext context, state) {
      var cubit = AuthCubit.get(context);
      return Form(
          key: cubit.registerOrganizationFormKey,
          child: Column(children: [
            const OrganizationRegistrationFields(),
            SizedBox(height: 33.h),
            SizedBox(
                width: 202.w,
                height: 47.h,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: const WidgetStatePropertyAll(
                            AppColors.primaryColor),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.r)))),
                    onPressed: () => cubit.validateOrganizationToSignUp(),
                    child: Text(StringManager.createAccount.tr(context),
                        style: TextStyle(
                            color: AppColors.secondColor, fontSize: 11.sp)))),
            SizedBox(height: 9.h),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(StringManager.alreadyHaveAnAccount.tr(context),
                  style: TextStyle(
                      fontSize: 10.sp, fontWeight: FontWeight.normal)),
              TextButton(
                  onPressed: () {
                    AppNavigation.navigateOffAll(const LoginScreen());
                  },
                  child: Text(StringManager.login.tr(context),
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.black)))
            ]),
            SizedBox(height: 15.h)
          ]));
    }, listener: (BuildContext context, state) {
      if (state is AuthSuccessState) {
        AppNavigation.navigateOffAll(const AppLayout());
      }
    });
  }
}