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
import 'package:roadapp/features/account/presentation/views/widgets/change_pic_bottom_sheet.dart';
import 'package:roadapp/features/account/presentation/views/widgets/delete_account_row.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 76.h),
          child: CustomAppBar(text: StringManager.profileSettings.tr(context))
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: BlocBuilder<AccountCubit, AccountState>(
                  builder: (context, state) {
                    var cubit = AccountCubit.get(context);
                    if(state is UpdateProfileSuccessState) {
                    Navigator.pop(context);
                    showToast(message: StringManager.profileUpdatedSuccessfully.tr(context), state: ToastStates.success);
                  }
                  return Form(
                      key: cubit.formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 32.h),
                            Center(
                                child: InkWell(
                                    onTap: () => showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            const ChangePicBottomSheet()),
                                    child: cubit.userImage)),
                            SizedBox(height: 32.h),
                            AccountTextField(
                              validator: (value) {
                                if(value == null || value.trim().isEmpty) return StringManager.nameCannotBeEmpty.tr(context);
                                return null;
                              },
                                text: StringManager.name.tr(context)),
                            AccountTextField(
                              inputType: TextInputType.phone,
                                validator: (value) {
                                  if(value == null || value.trim().isEmpty) return StringManager.phoneNumberIsRequired.tr(context);
                                  return null;
                                },
                                text: StringManager.phoneNumber.tr(context)),
                            AccountTextField(
                                inputType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return StringManager.pleaseEnterYourEmailAddress.tr(context);
                                  }
                                  if (!AppRegex.isEmailValid(value)) {
                                    return StringManager.invalidEmail.tr(context);
                                  }
                                  return null;
                                },
                                text: StringManager.email.tr(context)),
                            AccountTextField(
                              textInputAction: TextInputAction.done,
                                validator: (value) {
                                  if(value == null || value.trim().isEmpty) return StringManager.passwordIsRequired.tr(context);
                                  return null;
                                },
                                text: StringManager.password.tr(context)),
                            const DeleteAccountRow(),
                            SizedBox(height: 50.h),
                            const AccountDetailsButton(),
                            SizedBox(height: 50.h)
                          ])
                    );
                  }
                ))));
  }
}
