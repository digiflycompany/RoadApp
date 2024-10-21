import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/app_regex.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/components.dart';
import 'package:roadapp/features/auth/presentation/manager/auth_cubit.dart';
import 'package:roadapp/features/auth/presentation/manager/auth_state.dart';

class OrganizationRegistrationFields extends StatelessWidget {
  const OrganizationRegistrationFields({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      var cubit = AuthCubit.get(context);
      return Form(
        key: cubit.registerOrganizationFormKey,
        child: Column(children: [
          Row(children: [
            Expanded(
                child: Column(children: [
              defaultFormField(
                textController: cubit.companyNameController,
                type: TextInputType.name,
                validate: (String value) {
                  if (value.trim().isEmpty) {
                    return StringManager.enterOrganizationName.tr(context);
                  }
                  return null;
                },
                onSubmit: (value) {},
                inputAction: TextInputAction.next,
                labelText: StringManager.organizationName.tr(context),
              ),
              SizedBox(height: 20.h),
              defaultFormField(
                  textController: cubit.taxRegistrationNumberController,
                  type: TextInputType.number,
                  validate: (String value) {
                    if (value.trim().isEmpty) {
                      return StringManager.enterTaxRegistrationNumber.tr(context);
                    }
                    if (value.trim().length < 12) {
                      return StringManager
                          .taxRegistrationNumberCannotBeLessThan12Number
                          .tr(context);
                    }
                    return null;
                  },
                  maxLength: 12,
                  onSubmit: (value) {},
                  inputAction: TextInputAction.next,
                  labelText: StringManager.taxRegistrationNumber.tr(context)),
              SizedBox(height: 20.h),
              defaultFormField(
                  textController: cubit.companyManagerNameController,
                  type: TextInputType.name,
                  validate: (String value) {
                    if (value.trim().isEmpty) {
                      return StringManager.enterCompanyManagerName.tr(context);
                    }
                    return null;
                  },
                  labelText: StringManager.organizationOwnerName.tr(context))
            ])),
            SizedBox(width: 20.w),
            Expanded(
                child: Column(children: [
              defaultFormField(
                  textController: cubit.companyPhoneController,
                  type: TextInputType.phone,
                  validate: (String value) {
                    if (value.trim().isEmpty) {
                      return StringManager.enterOrganizationPhone.tr(context);
                    }
                    return null;
                  },
                  onSubmit: (value) {},
                  inputAction: TextInputAction.next,
                  labelText: StringManager.organizationLandline.tr(context)),
              SizedBox(height: 20.h),
              defaultFormField(
                  textController: cubit.commercialRegistrationNumberController,
                  type: TextInputType.number,
                  validate: (String value) {
                    if (value.trim().isEmpty) {
                      return StringManager.enterCommercialRegistrationNumber
                          .tr(context);
                    }
                    if (value.trim().length < 15) {
                      return StringManager
                          .commercialRegistrationNumberCannotBeLessThan15Numbers
                          .tr(context);
                    }
                    return null;
                  },
                  maxLength: 15,
                  onSubmit: (value) {},
                  inputAction: TextInputAction.next,
                  labelText:
                      StringManager.commercialRegistrationNumber.tr(context)),
              SizedBox(height: 20.h),
              defaultFormField(
                  textController: cubit.managerPhoneController,
                  type: TextInputType.phone,
                  validate: (String value) {
                    if (value.trim().isEmpty) {
                      return StringManager.enterCEOManagerPhone.tr(context);
                    }
                    return null;
                  },
                  labelText: StringManager.organizationOwnerPhone.tr(context))
            ]))
          ]),
          SizedBox(height: 20.h),
          defaultFormField(
              textController: cubit.companyEmailController,
              type: TextInputType.emailAddress,
              validate: (value) {
                if (value == null || value.isEmpty) {
                  return StringManager.pleaseEnterYourEmailAddress.tr(context);
                }
                if (!AppRegex.isEmailValid(value)) {
                  return StringManager.invalidEmail.tr(context);
                }
                return null;
              },
              onSubmit: (value) {},
              inputAction: TextInputAction.next,
              labelText: StringManager.email.tr(context)),
          SizedBox(height: 20.h),
          defaultFormField(
              textController: cubit.companyPasswordController,
              isPassword: cubit.visiblePassword,
              type: TextInputType.visiblePassword,
              suffixIcon: IconButton(
                  onPressed: () {
                    cubit.changePasswordVisibility();
                  },
                  icon: Icon(cubit.suffix)),
              validate: (String value) {
                if (value.trim().isEmpty) {
                  return StringManager.pleaseEnterYourPassword.tr(context);
                }
                return null;
              },
              labelText: AutofillHints.password.tr(context))
        ]),
      );
    });
  }
}