import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/widgets/components.dart';

class ProfileOptionItem extends StatelessWidget {
  const ProfileOptionItem({super.key, this.voidCallback, this.image, this.title, this.withDevider});


  final VoidCallback? voidCallback;
  final String? image;
  final String? title;
  final bool? withDevider;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          // onTap: (){
          //   navigateTo(context,  VehiclesScreen());
          // },
          onTap: voidCallback,
          child: Row(
            children: [
              SvgPicture.asset(
                image!,
                color: Colors.black,
                height: 22.h,
                width: 22.w,
              ),
              SizedBox(width: 10.w),
              Text(title!,
              style: const TextStyle(
                fontWeight: FontWeight.w600
              ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 15.r,
                    color: Colors.grey[400],
                  )),
            ],
          ),
        ), if(withDevider != false) divider(),
      ],
    );
  }
}
