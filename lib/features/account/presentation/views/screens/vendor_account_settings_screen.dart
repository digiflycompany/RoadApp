import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/functions/toast.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/custom_elevated_button_two.dart';
import 'package:roadapp/features/account/presentation/manager/account_cubit.dart';
import 'package:roadapp/features/account/presentation/manager/account_state.dart';
import 'package:roadapp/features/account/presentation/views/widgets/account_text_field.dart';
import 'package:roadapp/features/account/presentation/views/widgets/vendor_upload_profile_image.dart';

class VendorAccountSettingsScreen extends StatelessWidget {
  const VendorAccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AccountCubit.get(context);
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, 76.h),
            child: CustomAppBar(text: StringManager.profile.tr(context))),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: BlocBuilder<AccountCubit, AccountState>(
              builder: (context, state) {
                if(state is UpdateProfileSuccessState) {
                  Navigator.pop(context);
                  showToast(message: StringManager.profileUpdatedSuccessfully.tr(context), state: ToastStates.success);
                }
                return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Form(
                      key: cubit.vendorFormKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const VendorUploadImageProfile(),
                            Row(children: [
                              AccountTextField(
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return StringManager.centerNameIsRequired
                                          .tr(context);
                                    }
                                    return null;
                                  },
                                  text: StringManager.centerName.tr(context),
                                  width: 150.w,
                                  textColor: AppColors.greyColor5),
                              const Spacer(),
                              AccountTextField(
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return StringManager.phoneNumberIsRequired
                                          .tr(context);
                                    }
                                    return null;
                                  },
                                  text: StringManager.phoneNumber.tr(context),
                                  width: 150.w,
                                  textColor: AppColors.greyColor5,
                                  inputType: TextInputType.phone)
                            ]),
                            AccountTextField(
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return StringManager.fixedNumberIsRequired
                                        .tr(context);
                                  }
                                  return null;
                                },
                                text: StringManager.fixedNumber.tr(context),
                                textColor: AppColors.greyColor5,
                                inputType: TextInputType.number),
                            AccountTextField(
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return StringManager.addressIsRequired.tr(
                                        context);
                                  }
                                  return null;
                                },
                                text: StringManager.address.tr(context),
                                textColor: AppColors.greyColor5),
                            Row(children: [
                              AccountTextField(
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return StringManager.serviceIsRequired
                                          .tr(context);
                                    }
                                    return null;
                                  },
                                  text: StringManager.service.tr(context),
                                  width: 150.w,
                                  textColor: AppColors.greyColor5),
                              const Spacer(),
                              AccountTextField(
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return StringManager.priceIsRequired
                                          .tr(context);
                                    }
                                    return null;
                                  },
                                  text: StringManager.price.tr(context),
                                  width: 150.w,
                                  textColor: AppColors.greyColor5,
                                  inputType: TextInputType.number)
                            ]),
                            Row(children: [
                              AccountTextField(
                                  text: StringManager.service.tr(context),
                                  width: 150.w,
                                  textColor: AppColors.greyColor5),
                              const Spacer(),
                              AccountTextField(
                                  text: StringManager.price.tr(context),
                                  width: 150.w,
                                  textColor: AppColors.greyColor5,
                                  inputType: TextInputType.number)
                            ]),
                            Row(children: [
                              AccountTextField(
                                  text: StringManager.service.tr(context),
                                  width: 150.w,
                                  textColor: AppColors.greyColor5),
                              const Spacer(),
                              AccountTextField(
                                  text: StringManager.price.tr(context),
                                  width: 150.w,
                                  textColor: AppColors.greyColor5,
                                  inputType: TextInputType.number)
                            ]),
                            CustomElevatedButtonTwo(
                                width: 200.w,
                                height: 60.h,
                                onTap: () => cubit.validateVendorToSave(),
                                widget: Text(StringManager.save.tr(context),
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600))),
                            SizedBox(height: 40.h)
                          ]),
                    ));
              },
            )));
  }
}
