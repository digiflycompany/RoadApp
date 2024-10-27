import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/functions/toast.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/account/presentation/manager/account_cubit.dart';
import 'package:roadapp/features/account/presentation/manager/account_state.dart';
import 'package:roadapp/features/account/presentation/views/widgets/save_button.dart';
import 'package:roadapp/features/account/presentation/views/widgets/vendor_data_form.dart';
import 'package:roadapp/features/account/presentation/views/widgets/vendor_upload_profile_image.dart';

class VendorAccountSettingsScreen extends StatelessWidget {
  const VendorAccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, 76.h),
            child: CustomAppBar(text: StringManager.profile.tr(context))),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: BlocBuilder<AccountCubit, AccountState>(
                builder: (context, state) {
              if (state is UpdateProfileSuccessState) {
                Navigator.pop(context);
                showToast(
                    message:
                        StringManager.profileUpdatedSuccessfully.tr(context),
                    state: ToastStates.success);
              }
              return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const VendorUploadImageProfile(),
                        const VendorDataForm(),
                        const SaveButton(),
                        SizedBox(height: 40.h)
                      ]));
            })));
  }
}