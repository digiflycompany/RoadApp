import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/navigation/navigation.dart';
import 'package:roadapp/core/utils/app_regex.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/features/auth/presentation/manager/auth_cubit.dart';
import 'package:roadapp/features/auth/presentation/manager/auth_state.dart';
import 'package:roadapp/core/widgets/components.dart';

class LoginInputs extends StatelessWidget {
  const LoginInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          var cubit = AuthCubit.get(context);
          return Column(children: [
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
                labelText: StringManager.email.tr(context)),
            SizedBox(height: 20.h),
            defaultFormField(
                textController: cubit.passwordController,
                type: TextInputType.visiblePassword,
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return StringManager.pleaseEnterYourPassword.tr(context);
                  }
                  return null;
                },
                isPassword: cubit.visiblePassword,
                suffixIcon: IconButton(
                    onPressed: () {
                      cubit.changePasswordVisibility();
                    },
                    icon: Icon(cubit.suffix)),
                labelText: StringManager.password.tr(context))
          ]);
        });
  }
}
