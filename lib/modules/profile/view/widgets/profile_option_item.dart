import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileOptionItem extends StatelessWidget {
  const ProfileOptionItem({super.key, this.voidCallback, this.image, this.title});


  final VoidCallback? voidCallback;
  final String? image;
  final String? title;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: (){
      //   navigateTo(context,  VehiclesScreen());
      // },
      onTap: voidCallback,
      child: Row(
        children: [
          SvgPicture.asset(
            image!,
            height: 20.h,
            width: 20.w,
          ),
          SizedBox(width: 10.w),
          Text(title!),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 15.r,
              )),
        ],
      ),
    );
  }
}
