import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/modules/register/cubit/cubit.dart';
import 'package:roadapp/modules/register/cubit/states.dart';
import 'package:roadapp/modules/register/views/widgets/register_account_type.dart';
import 'package:roadapp/modules/register/views/widgets/register_background.dart';
import 'package:roadapp/modules/register/views/widgets/register_logo.dart';
import 'package:roadapp/modules/register/views/widgets/register_title.dart';
import 'package:roadapp/modules/register/views/widgets/register_user_type.dart';

import '../../../../shared/resources/colors.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Form(
                key: cubit.formKey,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const RegisterBackground(),
                    SingleChildScrollView(
                      child: Container(
                        color: AppColors.tertiary,
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        width: MediaQuery.of(context).size.width * 0.80,
                        child: Column(
                          children: [
                            const RegisterLogo(),
                            const RegisterTitle(),
                            SizedBox(
                              height: 14.h,
                            ),
                            const RegisterAccountType(),
                            const RegisterUserType(),
                            SizedBox(
                              height: 20.h,
                            ),
                            cubit.list[cubit.selectedRadioValue]
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
