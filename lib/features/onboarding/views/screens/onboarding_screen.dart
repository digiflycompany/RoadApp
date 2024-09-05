import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/onboarding/cubit/cubit.dart';
import 'package:roadapp/features/onboarding/cubit/states.dart';
import 'package:roadapp/features/onboarding/views/widgets/onboading_img.dart';
import 'package:roadapp/features/onboarding/views/widgets/onboarding_next_button.dart';
import 'package:roadapp/features/onboarding/views/widgets/onboardint_body.dart';
import 'package:roadapp/features/onboarding/views/widgets/onboardint_title.dart';

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
                  return const SafeArea(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                        OnBoardingImg(),
                        OnBoardingTitle(),
                        OnBoardingBody()
                      ]));
                })),
        bottomNavigationBar: const OnBoardingNextButton());
  }
}