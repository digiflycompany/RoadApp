import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/features/account/presentation/manager/account_cubit.dart';
import 'package:roadapp/features/account/presentation/manager/account_state.dart';
import 'package:roadapp/features/account/presentation/views/widgets/account_details_button.dart';
import 'package:roadapp/features/account/presentation/views/widgets/account_text_field.dart';
import 'package:roadapp/features/account/presentation/views/widgets/change_pic_bottom_sheet.dart';
import 'package:roadapp/features/account/presentation/views/widgets/delete_account_row.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 76.h),
          child: CustomAppBar(text: StringManager.profileSettings.tr(context)),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: BlocBuilder<AccountCubit, AccountState>(
                  builder: (context, state) {
                    var cubit = AccountCubit.get(context);
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 32.h),
                          Center(
                              child: InkWell(
                                  onTap: () => showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          const ChangePicBottomSheet()),
                                  child: Container(
                                      width: 110.w,
                                      height: 110.h,
                                      decoration: const BoxDecoration(
                                          color: AppColors.emptyImageColor,
                                          shape: BoxShape.circle),
                                      child: Center(child: cubit.userImage)))),
                          SizedBox(height: 32.h),
                          AccountTextField(
                              text: StringManager.name.tr(context)),
                          AccountTextField(
                              text: StringManager.phoneNumber.tr(context)),
                          AccountTextField(
                              text: StringManager.email.tr(context)),
                          AccountTextField(
                              text: StringManager.password.tr(context)),
                          const DeleteAccountRow(),
                          SizedBox(height: 50.h),
                          const AccountDetailsButton(),
                          SizedBox(height: 50.h)
                        ]);
                  },
                ))));
  }
}
