import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/features/login/cubit/cubit.dart';
import 'package:roadapp/features/login/cubit/states.dart';
import 'package:roadapp/core/widgets/components.dart';

class LoginInputs extends StatelessWidget {
  const LoginInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          var cubit = LoginCubit.get(context);
          return Column(children: [
            defaultFormField(
                textController: cubit.emailController,
                type: TextInputType.emailAddress,
                validate: (String value) {
                  if (value.isEmpty) {
                    return StringManager.pleaseEnterYourEmailAddress
                        .tr(context);
                  }
                },
                onSubmit: (value) {},
                inputAction: TextInputAction.next,
                hintText: StringManager.email.tr(context)),
            SizedBox(height: 20.h),
            defaultFormField(
                textController: cubit.passwordController,
                type: TextInputType.visiblePassword,
                validate: (String value) {
                  if (value.isEmpty) {
                    return StringManager.pleaseEnterYourPassword.tr(context);
                  }
                },
                isPassword: cubit.visiblePassword,
                suffixIcon: IconButton(
                    onPressed: () {
                      cubit.changePasswordVisibility();
                    },
                    icon: Icon(cubit.suffix)),
                hintText: StringManager.password.tr(context))
          ]);
        });
  }
}
