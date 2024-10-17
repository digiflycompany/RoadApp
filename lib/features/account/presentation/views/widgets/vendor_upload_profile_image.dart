import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/features/account/presentation/manager/account_cubit.dart';
import 'package:roadapp/features/account/presentation/manager/account_state.dart';
import 'package:roadapp/features/account/presentation/views/widgets/change_pic_bottom_sheet.dart';

class VendorUploadImageProfile extends StatelessWidget {
  const VendorUploadImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AccountCubit.get(context);
    return Padding(
        padding: EdgeInsets.only(top: 15.h, bottom: 26.h),
        child: InkWell(
            onTap: () => showModalBottomSheet(
                context: context,
                builder: (BuildContext context) =>
                    const ChangePicBottomSheet(vendor: true)),
            child: Container(
                height: 140.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.greyColor4,
                    borderRadius: BorderRadius.circular(6.r)),
                child: BlocBuilder<AccountCubit, AccountState>(
                    builder: (BuildContext context, state) =>
                        cubit.userImage))));
  }
}