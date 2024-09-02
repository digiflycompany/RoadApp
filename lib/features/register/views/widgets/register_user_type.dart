import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/register/cubit/cubit.dart';
import 'package:roadapp/features/register/cubit/states.dart';

class RegisterUserType extends StatelessWidget {
  const RegisterUserType({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (BuildContext context, RegisterStates state) {  },
      builder: (BuildContext context, RegisterStates state) {
        var cubit = RegisterCubit.get(context);
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Row(
            children: [
              Text("نوع المستخدم",
                  style: TextStyle(fontSize: 11.sp)),
              SizedBox(width: 10.w),
              Radio(
                value: 0,
                groupValue: cubit.selectedRadioValue,
                visualDensity: const VisualDensity(
                    horizontal:
                    VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity),
                materialTapTargetSize:
                MaterialTapTargetSize.shrinkWrap,
                onChanged: (value) {
                  cubit.changeUserType(value!);
                },
              ),
              Text(
                'شخص',
                style: TextStyle(fontSize: 11.sp),
              ),
              SizedBox(width: 10.w),
              Radio(
                value: 1,
                groupValue: cubit.selectedRadioValue,
                visualDensity: const VisualDensity(
                    horizontal:
                    VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity),
                materialTapTargetSize:
                MaterialTapTargetSize.shrinkWrap,
                onChanged: (value) {
                  cubit.changeUserType(value!);
                },
              ),
              Text(
                'شركة',
                style: TextStyle(fontSize: 11.sp),
              ),
            ],
          ),
        );
      },
    );
  }
}
