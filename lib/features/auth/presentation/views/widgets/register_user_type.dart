import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/features/auth/presentation/manager/auth_cubit.dart';
import 'package:roadapp/features/auth/presentation/manager/auth_state.dart';

class RegisterUserType extends StatelessWidget {
  const RegisterUserType({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
        listener: (BuildContext context, AuthState state) {},
        builder: (BuildContext context, AuthState state) {
          var cubit = AuthCubit.get(context);
          return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Row(children: [
                Text(StringManager.userType.tr(context),
                    style: TextStyle(fontSize: 11.sp)),
                SizedBox(width: 10.w),
                Radio(
                    value: 0,
                    groupValue: cubit.selectedRadioValue,
                    visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onChanged: (value) {
                      cubit.changeUserType(value!);
                    }),
                Text(StringManager.person.tr(context),
                    style: TextStyle(fontSize: 11.sp)),
                SizedBox(width: 10.w),
                Radio(
                    value: 1,
                    groupValue: cubit.selectedRadioValue,
                    visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onChanged: (value) {
                      cubit.changeUserType(value!);
                    }),
                Text(StringManager.organization.tr(context),
                    style: TextStyle(fontSize: 11.sp))
              ]));
        });
  }
}