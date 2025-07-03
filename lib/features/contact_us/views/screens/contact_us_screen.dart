import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/dependency_injection/di.dart';
import 'package:roadapp/core/helpers/functions/toast.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/custom_elevated_button_two.dart';
import 'package:roadapp/features/contact_us/data/repo/contact_us_repo.dart';
import 'package:roadapp/features/contact_us/views/cubit/contact_us_cubit.dart';


import '../../../../core/helpers/app_regex.dart';
import '../widgets/select_problem_widget.dart';
import '../widgets/text_field_contact_us.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactUsCubit(getIt.get<ContactUsRepo>())..fetchSupportsType(),
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(text: StringManager.contactUs.tr(context))),
        body: BlocConsumer<ContactUsCubit, ContactUsState>(
          listener: (context, state) {
            var cubit = ContactUsCubit.get(context);
            if(state is AddContactUsSuccess){
              cubit.noteController.clear();
              cubit.emailController.clear();
              cubit.phoneController.clear();
              cubit.firstNameController.clear();
              cubit.lastNameController.clear();
              cubit.typeController.clear();
              showToast(message: 'Success', state: ToastStates.success);
            }
          },
          builder: (context, state) {
            var cubit = ContactUsCubit.get(context);
            return Form(
              key: cubit.contactUsFormKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20.r),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFieldContactUs(
                              title: StringManager.firstName.tr(context),
                              hint: StringManager.firstName.tr(context),
                              controller: cubit.firstNameController,
                              validationFunc: (String? value) {
                                if (value!.isEmpty) {
                                  return StringManager.enterName.tr(context);
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Expanded(
                            child: TextFieldContactUs(
                              title: StringManager.lastName.tr(context),
                              hint: StringManager.lastName.tr(context),
                              controller: cubit.lastNameController,
                              validationFunc: (String? value) {
                                if (value!.isEmpty) {
                                  return StringManager.enterName.tr(context);
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      TextFieldContactUs(
                        title: StringManager.email.tr(context),
                        hint: StringManager.email.tr(context),
                        textInputType: TextInputType.emailAddress,
                        controller: cubit.emailController,
                        validationFunc: (value) {
                          if (value == null || value.isEmpty) {
                            return StringManager.pleaseEnterYourEmailAddress
                                .tr(context);
                          }
                          if (!AppRegex.isEmailValid(value)) {
                            return StringManager.invalidEmail.tr(context);
                          }
                          return null;
                        },
                      ),

                      TextFieldContactUs(
                        title: StringManager.phoneNumber.tr(context),
                        hint: StringManager.phoneNumber.tr(context),
                        textInputType: TextInputType.phone,
                        controller: cubit.phoneController,
                        validationFunc: (value) {
                          if (value!.isEmpty) {
                            return StringManager.enterCEOManagerPhone
                                .tr(context);
                          }
                          return null;
                        },
                      ),
                       SelectProblemWidget(
                        cubit: cubit,
                        state: state,
                      ),
                      TextFieldContactUs(
                        height: 200.h,
                        title: StringManager.message.tr(context),
                        hint: StringManager.writeYourMessageHere.tr(context),
                        maxLines: 50,
                        controller: cubit.noteController,
                        validationFunc: (value) {
                          if (value!.isEmpty) {
                            return StringManager.enterCEOManagerPhone
                                .tr(context);
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      state is AddContactUsLoading
                          ? const Center(child: CircularProgressIndicator())
                          : CustomElevatedButtonTwo(
                              width: double.infinity,
                              onTap: () {
                                if (cubit.contactUsFormKey.currentState!
                                    .validate()) {
                                  cubit.addContactUs();
                                }
                              },
                              widget: Text(
                                StringManager.confirm.tr(context),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
