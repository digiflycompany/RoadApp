import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/clients/views/widgets/customer_info_table.dart';

class ClientData extends StatelessWidget {
  const ClientData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(children: [
          Container(
              padding:
              EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("جاد مرسي",
                        style: TextStyle(
                            color: Colors.white, fontSize: 11.sp)),
                    Text("ذكر",
                        style: TextStyle(
                            color: Colors.white, fontSize: 11.sp)),
                    Text("ظابط",
                        style: TextStyle(
                            color: Colors.white, fontSize: 11.sp)),
                    Text("0123456789",
                        style: TextStyle(
                            color: Colors.white, fontSize: 11.sp)),
                    Text("3",
                        style: TextStyle(
                            color: Colors.white, fontSize: 11.sp))
                  ])),
          SizedBox(height: 10.h),
          const CustomerInfoTable()
        ]));
  }
}
