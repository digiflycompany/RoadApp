import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/modules/onboarding/cubit/cubit.dart';
import 'package:roadapp/modules/onboarding/cubit/states.dart';

class OnBoardingPolicy extends StatelessWidget {
  const OnBoardingPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider<OnBoardingCubit>(
      create: (context) => OnBoardingCubit(),
      child: BlocConsumer<OnBoardingCubit, OnBoardingStates>(
        listener: (context, state) {},
        builder: (BuildContext context, state) {
          var cubit = OnBoardingCubit.get(context);
          return Row(
            children: [
              Checkbox(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                value: cubit.checkBoxValue,
                onChanged: (val) {
                  cubit.changeCheckBoxValue(val);
                },
                visualDensity: VisualDensity.compact,
              ),
              Text(
                'الموافقة علي سياسة العضوية',
                style: TextStyle(fontSize: 10.sp),
              ),
            ],
          );
        },
      ),
    );
  }
}
