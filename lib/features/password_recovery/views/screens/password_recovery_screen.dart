import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/app_regex.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/auth_logo.dart';
import 'package:roadapp/features/password_recovery/cubit/password_recovery_cubit.dart';
import 'package:roadapp/features/password_recovery/cubit/password_recovery_states.dart';
import 'package:roadapp/features/password_recovery/views/screens/verification_screen.dart';
import 'package:roadapp/core/navigation/navigation.dart';
import 'package:roadapp/core/widgets/components.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/Theming/colors.dart';

class PasswordRecoveryScreen extends StatelessWidget {
  const PasswordRecoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PasswordRecoveryCubit>(
        create: (BuildContext context) => PasswordRecoveryCubit(),
        child: BlocConsumer<PasswordRecoveryCubit, PasswordRecoveryStates>(
            listener: (BuildContext context, PasswordRecoveryStates state) {
          if (state is RequestCodeSuccessState) {
            AppNavigation.navigateReplacement(const VerificationScreen());
          }
        }, builder: (BuildContext context, PasswordRecoveryStates state) {
          final cubit = context.read<PasswordRecoveryCubit>();
          return Scaffold(
              body: Stack(alignment: Alignment.center, children: [
            SvgPicture.asset(AppAssets.roadBackground,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.fill),
            SingleChildScrollView(
                child: Container(
                    color: AppColors.tertiary,
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    width: MediaQuery.of(context).size.width * 0.80,
                    child: Form(
                        key: cubit.requestFormKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 50.h),
                              const AuthLogo(),
                              SizedBox(height: 20.h),
                              Text(StringManager.passwordRecovery.tr(context),
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 14.h),
                              Text(
                                  StringManager
                                      .pleaseEnterRegisteredPhoneNumberToResetPassword
                                      .tr(context),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 10.sp)),
                              SizedBox(height: 25.h),
                              defaultFormField(
                                  textController: cubit.phoneController,
                                  type: TextInputType.phone,
                                  validate: (String value) {
                                    if (value.trim().isEmpty) {
                                      return StringManager.phoneNumberIsRequired
                                          .tr(context);
                                    }
                                    return null;
                                  },
                                  onSubmit: (value) {},
                                  inputAction: TextInputAction.next,
                                  labelText:
                                      StringManager.phoneNumber.tr(context),
                                  hint: StringManager.enterPhoneNumberHere
                                      .tr(context)),
                              SizedBox(height: 20.h),
                              defaultFormField(
                                  textController: cubit.emailController,
                                  type: TextInputType.emailAddress,
                                  validate: (value) {
                                    if (value == null || value.isEmpty) {
                                      return StringManager
                                          .pleaseEnterYourEmailAddress
                                          .tr(context);
                                    }
                                    if (!AppRegex.isEmailValid(value)) {
                                      return StringManager.invalidEmail
                                          .tr(context);
                                    }
                                    return null;
                                  },
                                  onSubmit: (value) {},
                                  inputAction: TextInputAction.next,
                                  hint:
                                      StringManager.enterEmailHere.tr(context),
                                  labelText: StringManager.email.tr(context)),
                              SizedBox(height: 46.h),
                              SizedBox(
                                  width: 202.w,
                                  height: 47.h,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              const MaterialStatePropertyAll(
                                                  AppColors.primaryColor),
                                          shape:
                                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.r)))),
                                      onPressed: () =>
                                          cubit.validateToRequestCode(),
                                      child: Text(StringManager.send.tr(context),
                                          style: TextStyle(
                                              color: AppColors.secondColor,
                                              fontSize: 11.sp)))),
                              SizedBox(height: 50.h)]))))]));}));}}