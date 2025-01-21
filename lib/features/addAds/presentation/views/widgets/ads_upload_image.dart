import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/features/addAds/presentation/cubit/ads_cubit.dart';
import 'package:roadapp/features/addAds/presentation/views/widgets/upload_image_camera_or_gallary.dart';
import '../../../../../core/Theming/colors.dart';

class AdsUploadImage extends StatelessWidget {
  const AdsUploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AdsCubit.get(context);
    return Padding(
      padding: EdgeInsets.only(top: 15.h, bottom: 26.h),
      child: InkWell(
        onTap: () => showModalBottomSheet(
            context: context,
            builder: (BuildContext context) => UploadImageCameraOrGallery(
                  vendor: true,
                  cubit: cubit,
                )),
        child: Container(
          width: double.infinity,
          height: 140.h,
          decoration: ShapeDecoration(
            color: const Color(0xFFF9FAFA),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFFE4DFDF)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: BlocBuilder<AdsCubit, AdsState>(
            builder: (BuildContext context, state) {
              return Container(
                width: 110.w,
                height: 110.h,
                decoration: const BoxDecoration(
                    color: AppColors.emptyImageColor, shape: BoxShape.circle),
                child: Center(
                  child: cubit.image == null
                      ? SvgPicture.asset(
                          AppAssets.emptyImageIcon,
                          width: 50,
                          height: 50,
                        )
                      : Container(
                          width: 110.w,
                          height: 110.h,
                          decoration: const BoxDecoration(
                              color: AppColors.emptyImageColor,
                              shape: BoxShape.circle),
                          child: Image.file(File(
                              cubit.image!.path),
                            fit: BoxFit.cover,)),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
