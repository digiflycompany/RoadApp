import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/login/cubit/cubit.dart';
import 'package:roadapp/features/login/cubit/states.dart';
import 'package:roadapp/shared/components.dart';

class LoginInputs extends StatelessWidget {
  const LoginInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = LoginCubit.get(context);
        return Column(
          children: [
            defaultFormField(
              textController: cubit.emailController,
              type: TextInputType.emailAddress,
              validate: (String value) {
                if (value.isEmpty) {
                  return "Please enter your Email address";
                }
              },
              onSubmit: (value) {},
              inputAction: TextInputAction.next,
              hintText: "البريد الإلكتروني",
            ),
            SizedBox(height: 20.h),
            defaultFormField(
              textController: cubit.passwordController,
              type: TextInputType.visiblePassword,
              validate: (String value) {
                if (value.isEmpty) {
                  return "Password is too short";
                }
              },
              isPassword: cubit.visiblePassword,
              suffixIcon: IconButton(
                  onPressed: () {
                    cubit.changePasswordVisibility();
                  },
                  icon: Icon(cubit.suffix)),
              hintText: "كلمة المرور",
            ),
          ],
        );
      },
    );
  }
}
