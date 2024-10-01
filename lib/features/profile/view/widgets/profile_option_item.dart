import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/Theming/styles.dart';

class ProfileOptionItem extends StatelessWidget {
  const ProfileOptionItem(
      {super.key, this.voidCallback, this.image, this.title});

  final VoidCallback? voidCallback;
  final String? image;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: voidCallback,
        child: Row(children: [
          SvgPicture.asset(image!,
              color: Colors.black, height: 16.h, width: 16.w),
          SizedBox(width: 10.w),
          SizedBox(
              width: MediaQuery.of(context).size.width * .49,
              child: Text(title!, style: Styles.textStyle12.copyWith(fontWeight: FontWeight.w600))),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_forward_ios,
                  size: 13.r, color: Colors.grey[400]))
        ]));
  }
}