import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/widgets/custom_image.dart';

class ImageAndNameAndLocationWidget extends StatelessWidget {
  const ImageAndNameAndLocationWidget({
    super.key,
    required this.nameCenter,
    required this.location, this.image,
  });

  final String? image;
  final String nameCenter;
  final String location;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomImage(
              imagePath: image,
              h: height * .2,
              fit: BoxFit.cover,
              w: double.infinity),
          Container(
            width: double.infinity,
            height: 30.h,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            color: AppColors.secondColor.withOpacity(0.56),
            child: Row(
              children: [
                Text(nameCenter,
                    style:
                        TextStyle(fontSize: 9.sp, color: AppColors.tertiary)),
                const Spacer(),
                SvgPicture.asset(AppAssets.pinIcon,
                    height: 7.h,
                    width: 7.w,
                    colorFilter:
                        const ColorFilter.mode(Colors.red, BlendMode.srcIn)),
                SizedBox(width: 5.w),
                Container(height: 10.h, width: .7.w, color: Colors.white),
                SizedBox(width: 5.w),
                Text(location,
                    style: TextStyle(fontSize: 9.sp, color: AppColors.tertiary))
              ],
            ),
          )
        ],
      ),
    );
  }
}
