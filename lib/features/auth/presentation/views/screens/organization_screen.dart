import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:roadapp/features/auth/presentation/cubit/auth_state.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/features/auth/presentation/views/widgets/create_account_button.dart';
import 'package:roadapp/features/auth/presentation/views/widgets/go_to_login.dart';
import 'package:roadapp/features/auth/presentation/views/widgets/organization_registration_fields.dart';
import 'package:roadapp/features/layout/presentation/views/screens/app_layout.dart';

class OrganizationScreen extends StatelessWidget {
  const OrganizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
        builder: (BuildContext context, state) {
      return Column(children: [
        const OrganizationRegistrationFields(),
        SizedBox(height: 33.h),
        const CreateAccountButton(),
        SizedBox(height: 9.h),
        const GoToLogin(),
        SizedBox(height: 15.h)
      ]);
    });
  }
}