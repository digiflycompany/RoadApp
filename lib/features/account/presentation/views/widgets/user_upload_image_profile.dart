import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/features/account/presentation/manager/account_cubit.dart';
import 'package:roadapp/features/account/presentation/manager/account_state.dart';
import 'package:roadapp/features/account/presentation/views/widgets/change_pic_bottom_sheet.dart';

class UserUploadImageProfile extends StatelessWidget {
  const UserUploadImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AccountCubit.get(context);
    return Padding(
      padding: EdgeInsets.only(top: 15.h, bottom: 26.h),
      child: InkWell(
        onTap: () => showModalBottomSheet(
            context: context,
            builder: (BuildContext context) => ChangePicBottomSheet(
              vendor: true,
              cubit: cubit,
            )),
        child: Container(
          height: 140.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.greyColor4,
              borderRadius: BorderRadius.circular(6.r)),
          child: BlocBuilder<AccountCubit, AccountState>(
            builder: (BuildContext context, state) {
              if (cubit.image == null) {
                return cubit.imageUrl != null
                    ? Container(
                  width: 110.w,
                  height: 110.h,
                  decoration: const BoxDecoration(
                      color: AppColors.emptyImageColor, shape: BoxShape.circle),
                  child: Center(
                    child: SvgPicture.asset(
                      AppAssets.emptyImageIcon,
                      width: 50,
                      height: 50,
                    ) ,
                  ),
                ) : Container(
                  width: 110.w,
                  height: 110.h,
                  decoration: const BoxDecoration(
                      color: AppColors.emptyImageColor, shape: BoxShape.circle),
                  child: Center(
                    child: Image.network(
                      cubit.userUser!.picture!,
                      width: 85.w,
                      height: 85.h,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.error,
                          color: AppColors.red,
                        );
                      },
                    ) ,
                  ),
                );
              } else {
                return Container(
                  width: 110.w,
                  height: 110.h,
                  decoration: BoxDecoration(
                    color: AppColors.emptyImageColor,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image:  FileImage(File(cubit.image!.path))
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
