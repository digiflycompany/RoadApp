import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/clients/views/widgets/customer_info_table.dart';
import 'package:roadapp/features/clients/views/widgets/details_options_row.dart';

class ClientsDetailsScreen extends StatelessWidget {
  final TextEditingController company = TextEditingController();

  ClientsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(
                text: StringManager.identifiedCustomers.tr(context))),
        body: Column(children: [
          SizedBox(height: 10.h),
          const DetailsOptionsRow(),
          SizedBox(height: 20.h),
          Padding(
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
              ]))
        ]));
  }
}