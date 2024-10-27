import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/account/presentation/manager/account_cubit.dart';
import 'package:roadapp/features/account/presentation/manager/account_state.dart';
import 'package:roadapp/features/account/presentation/views/widgets/account_text_field.dart';

class VendorDataForm extends StatelessWidget {
  const VendorDataForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(builder: (context, state) {
      return Form(
          child: Column(children: [
        Row(children: [
          AccountTextField(
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return StringManager.centerNameIsRequired.tr(context);
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
                  return StringManager.phoneNumberIsRequired.tr(context);
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
                return StringManager.fixedNumberIsRequired.tr(context);
              }
              return null;
            },
            text: StringManager.fixedNumber.tr(context),
            textColor: AppColors.greyColor5,
            inputType: TextInputType.number),
        AccountTextField(
            validator: (value) {
              if (value!.trim().isEmpty) {
                return StringManager.addressIsRequired.tr(context);
              }
              return null;
            },
            text: StringManager.address.tr(context),
            textColor: AppColors.greyColor5),
        Row(children: [
          AccountTextField(
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return StringManager.serviceIsRequired.tr(context);
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
                  return StringManager.priceIsRequired.tr(context);
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
        ])
      ]));
    });
  }
}