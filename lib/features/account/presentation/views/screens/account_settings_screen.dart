import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/functions/toast.dart';
import 'package:roadapp/core/utils/app_regex.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/account/presentation/manager/account_cubit.dart';
import 'package:roadapp/features/account/presentation/manager/account_state.dart';
import 'package:roadapp/features/account/presentation/views/widgets/account_details_button.dart';
import 'package:roadapp/features/account/presentation/views/widgets/account_text_field.dart';
import 'package:roadapp/features/account/presentation/views/widgets/delete_account_row.dart';
import 'package:roadapp/features/account/presentation/views/widgets/user_data_form.dart';
import 'package:roadapp/features/account/presentation/views/widgets/user_image.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, 76.h),
            child:
                CustomAppBar(text: StringManager.profileSettings.tr(context))),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 32.h),
                        const UserImage(),
                        SizedBox(height: 32.h),
                        const UserDataForm(),
                        const DeleteAccountRow(),
                        SizedBox(height: 50.h),
                        const AccountDetailsButton(),
                        SizedBox(height: 50.h)
                      ]))));
  }
}
