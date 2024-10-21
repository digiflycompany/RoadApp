import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/custom_data_table.dart';

class ClientsScreen extends StatelessWidget {
  final List<List<String>> cells = [
    ["1", "أحمد نبيل", "ذكر", "طبيب", "0123456789", "1"],
    ["2", "أيمن حازم", "ذكر", "مهندس", "0123456789", "2"],
    ["3", "ندى شوقي", "انثى", "معلمة", "0123456789", "1"],
    ["4", "جاد مرسي", "ذكر", "ظابط", "0123456789", "3"],
    ["5", "إيمان أحمد", "انثى", "تسويق", "0123456789", "1"],
  ];

  final TextEditingController company = TextEditingController();

  ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final columns = [
      StringManager.s.tr(context),
      StringManager.clientName.tr(context),
      StringManager.gender.tr(context),
      StringManager.job.tr(context),
      StringManager.phoneNumber.tr(context),
      StringManager.vehiclesNumber.tr(context)
    ];
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(
                text: StringManager.identifiedCustomers.tr(context))),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              SizedBox(height: 10.h),
              FittedBox(
                  child: Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 30.h),
                      child:
                          CustomMultiRowsTable(columns: columns, rows: cells)))
            ])));
  }
}