import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/app_regex.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/features/auth/presentation/manager/auth_cubit.dart';
import 'package:roadapp/features/auth/presentation/manager/auth_state.dart';
import 'package:roadapp/features/auth/presentation/views/screens/login_screen.dart';
import 'package:roadapp/core/widgets/components.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/navigation/navigation.dart';
import 'package:roadapp/features/layout/views/screens/app_layout.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
        builder: (BuildContext context, state) {
          if(state is AuthSuccessState) AppNavigation.navigateOffAll(const AppLayout());
          var cubit = AuthCubit.get(context);
          return Form(
            key: cubit.registerPersonFormKey,
            child: Column(children: [
              defaultFormField(
                textController: cubit.nameController,
                type: TextInputType.name,
                validate: (String value) {
                  if (value.isEmpty) {
                    return StringManager.enterName.tr(context);
                  }
                },
                onSubmit: (value) {},
                inputAction: TextInputAction.next,
                hintText: StringManager.name.tr(context)
              ),
              SizedBox(height: 20.h),
              defaultFormField(
                textController: cubit.phoneController,
                type: TextInputType.phone,
                validate: (String value) {
                  if (value.isEmpty) {
                    return StringManager.enterPhoneNumber.tr(context);
                  }
                },
                onSubmit: (value) {},
                inputAction: TextInputAction.next,
                hintText: StringManager.phoneNumber.tr(context)),
              SizedBox(height: 20.h),
              defaultFormField(
                  textController: cubit.emailController,
                  type: TextInputType.emailAddress,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return StringManager.pleaseEnterYourEmailAddress.tr(context);
                    }
                    if (!AppRegex.isEmailValid(value)) {
                      return StringManager.invalidEmail.tr(context);
                    }
                    return null;
                  },
                  onSubmit: (value) {},
                  inputAction: TextInputAction.next,
                  hintText: StringManager.email.tr(context)),
              SizedBox(height: 20.h),
              defaultFormField(
                  textController: cubit.passwordController,
                  isPassword: cubit.visiblePassword,
                  type: TextInputType.visiblePassword,
                  suffixIcon: IconButton(
                      onPressed: () {
                        cubit.changePasswordVisibility();
                      },
                      icon: Icon(cubit.suffix)),
                  validate: (String value) {
                    if (value.isEmpty) {
                      return StringManager.pleaseEnterYourPassword.tr(context);
                    }
                  },
                  hintText: StringManager.password.tr(context)),
              SizedBox(height: 33.h),
              SizedBox(
                width: 202.w,
                height: 47.h,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(AppColors.primaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.r)))),
                  onPressed: () => cubit.validatePersonToSignUp(),
                  child: Text(StringManager.createAccount.tr(context),
                      style: TextStyle(
                          color: AppColors.secondColor, fontSize: 11.sp)),
                ),
              ),
              SizedBox(height: 9.h),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  StringManager.alreadyHaveAnAccount.tr(context),
                  style:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.normal),
                ),
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
            ]),
          );
        },
        listener: (BuildContext context, state) {});
  }
}
