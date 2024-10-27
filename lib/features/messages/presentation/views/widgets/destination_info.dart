import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/app_assets.dart';

class DestinationInfo extends StatelessWidget {
  const DestinationInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CircleAvatar(radius: 35.r, child: Image.asset(AppAssets.person4)),
      SizedBox(width: 10.w),
      Column(children: [
        const Text("مركز الوكيل",
            style: TextStyle(fontWeight: FontWeight.w500)),
        Text("نشط منذ 10 دقائق", style: TextStyle(fontSize: 8.sp))
      ]),
      const Spacer(),
      IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
    ]);
  }
}