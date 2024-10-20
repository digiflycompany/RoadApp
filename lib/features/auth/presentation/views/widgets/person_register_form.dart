import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/app_regex.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/components.dart';
import 'package:roadapp/features/auth/presentation/manager/auth_cubit.dart';
import 'package:roadapp/features/auth/presentation/manager/auth_state.dart';

class PersonRegisterForm extends StatelessWidget {
  const PersonRegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
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
                labelText: StringManager.name.tr(context)),
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
                labelText: StringManager.phoneNumber.tr(context)),
            SizedBox(height: 20.h),
            defaultFormField(
                textController: cubit.emailController,
                type: TextInputType.emailAddress,
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return StringManager.pleaseEnterYourEmailAddress
                        .tr(context);
                  }
                  if (!AppRegex.isEmailValid(value)) {
                    return StringManager.invalidEmail.tr(context);
                  }
                  return null;
                },
                onSubmit: (value) {},
                inputAction: TextInputAction.next,
                labelText: StringManager.email.tr(context)),
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
                labelText: StringManager.password.tr(context))
          ]));
    });
  }
}