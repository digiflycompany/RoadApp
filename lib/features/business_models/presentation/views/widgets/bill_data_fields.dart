import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';

class BillDataFields extends StatelessWidget {
  const BillDataFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(children: [
            Row(children: [
              Column(children: [
                Text("${StringManager.billNumber.tr(context)}: ",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 12.sp)),
                SizedBox(
                  height: 13.h,
                ),
                Text('${StringManager.clientName.tr(context)}: ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 12.sp)),
                SizedBox(height: 20.h),
                Text('${StringManager.billType.tr(context)}: ',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp))
              ]),
              SizedBox(width: 6.w),
              Column(children: [
                SizedBox(
                    width: 86.w,
                    height: 32.h,
                    child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5.r)),
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 2.h, horizontal: 10.w)))),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                    width: 86.w,
                    height: 32.h,
                    child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5.r)),
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 2.h, horizontal: 10.w)))),
                SizedBox(height: 10.h),
                SizedBox(
                    width: 86.w,
                    height: 32.h,
                    child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5.r)),
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 2.h, horizontal: 10.w))))
              ])
            ])
          ]),
          const Spacer(),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text(StringManager.billDate.tr(context),
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12.sp)),
                    SizedBox(height: 13.h),
                    Text(StringManager.clientCode.tr(context),
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12.sp))
                  ]),
                  SizedBox(width: 6.w),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 86.w,
                            height: 32.h,
                            child: TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(5.r)),
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 2.h, horizontal: 10.w)))),
                        SizedBox(height: 10.h),
                        SizedBox(
                            width: 86.w,
                            height: 32.h,
                            child: TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(5.r)),
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 2.h, horizontal: 10.w))))
                      ])
                ])
              ])
        ]);
  }
}