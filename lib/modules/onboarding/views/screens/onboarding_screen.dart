import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/modules/onboarding/cubit/cubit.dart';
import 'package:roadapp2/modules/onboarding/cubit/states.dart';
import 'package:roadapp2/modules/onboarding/views/widgets/onboading_img.dart';
import 'package:roadapp2/modules/onboarding/views/widgets/onboarding_next_button.dart';
import 'package:roadapp2/modules/onboarding/views/widgets/onboardint_body.dart';
import 'package:roadapp2/modules/onboarding/views/widgets/onboardint_policy.dart';
import 'package:roadapp2/modules/onboarding/views/widgets/onboardint_title.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<OnBoardingCubit>(
        create: (context) => OnBoardingCubit(),
        child: BlocConsumer<OnBoardingCubit, OnBoardingStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const OnBoardingImg(),
                  const OnBoardingTitle(),
                  const OnBoardingBody(),
                  SizedBox(height: 80.h),
                  const OnBoardingPolicy(),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const OnBoardingNextButton(),
    );
  }
}

