import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/functions/show_default_dialog.dart';
import 'package:roadapp/core/helpers/functions/show_default_loading_indicator.dart';
import 'package:roadapp/core/helpers/functions/toast.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/account/data/models/account_response.dart';
import 'package:roadapp/features/account/presentation/manager/account_cubit.dart';
import 'package:roadapp/features/account/presentation/manager/account_state.dart';
import 'package:roadapp/features/account/presentation/views/widgets/account_details_button.dart';
import 'package:roadapp/features/account/presentation/views/widgets/account_loading_shimmer.dart';
import 'package:roadapp/features/account/presentation/views/widgets/delete_account_row.dart';
import 'package:roadapp/features/account/presentation/views/widgets/user_data_form.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch account data when screen is loaded.
    context.read<AccountCubit>().fetchAccount();
    context.read<AccountCubit>().fetchAccountUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 76.h),
          child: CustomAppBar(text: StringManager.profileSettings.tr(context)),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: BlocBuilder<AccountCubit, AccountState>(
                builder: (context, state) {
              var cubit = AccountCubit.get(context);

              // Handle success state
              if (state is UpdateProfileSuccessState) {
                // Post-frame callback to show success toast after the current frame
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.pop(context);
                  showToast(
                      message:
                          StringManager.profileUpdatedSuccessfully.tr(context),
                      state: ToastStates.success);
                });
              }

              // Handle loading state
              if (state is UpdateProfileLoadingState) {
                // Show loading indicator after the current build frame
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showDefaultLoadingIndicator(context, cancelable: false);
                });
              }

              // Handle error state
              if (state is UpdateProfileErrorState) {
                // Show error dialog after the current build frame
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showDefaultDialog(context,
                      type: NotificationType.error,
                      description: state.errorMessage,
                      title: StringManager.errorUpdatingProfile.tr(context));
                });
              }

              // Handle loading state for account data
              if (state is AccountLoadingState) {
                return const AccountLoadingShimmer();
              }

              // Handle error state for account data
              if (state is AccountErrorState) {
                return Center(child: Text(state.errorMessage));
              }

              // Handle success state for account data
              if (state is AccountSuccessState) {
                return _buildAccountContent(state.userData.user!, cubit);
              }

              // Default case (this could be empty state or initial state)
              return _buildAccountContent(cubit.user!, cubit);
            })));
  }

  // Build the content for the account settings screen
  Widget _buildAccountContent(User user, AccountCubit cubit) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 32.h),
          // const UserImage(),
          SizedBox(height: 32.h),
          UserDataForm(user: user),
          const DeleteAccountRow(),
          SizedBox(height: 50.h),
          const AccountDetailsButton(),
          SizedBox(height: 50.h)
        ]));
  }
}