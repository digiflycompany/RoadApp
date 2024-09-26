import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/profile/view/widgets/profile_background.dart';
import 'package:roadapp/features/profile/view/widgets/profile_information.dart';
import 'package:roadapp/features/profile/view/widgets/profile_options.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      const ProfileBackground(),
      SafeArea(
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 32.h),
                    const ProfileInformation(),
                    SizedBox(height: 15.h),
                    const ProfileOptions()
                  ])))
    ]));
  }
}