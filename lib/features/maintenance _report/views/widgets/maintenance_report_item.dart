import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/helpers/string_manager.dart';

class MaintenanceReportItem extends StatelessWidget {
  const MaintenanceReportItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: .5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
        child: Padding(
            padding: const EdgeInsets.all(12),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.27),
                      borderRadius: BorderRadius.circular(4.r)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 24),
                  child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      spacing: 5,
                      children: [
                        Text(
                            "${StringManager.serviceCenter.tr(context)} أحمد حسني",
                            style: Styles.textStyle12.copyWith(fontSize: 10)),
                        const Spacer(),
                        Text(
                            '${StringManager.phoneNumber.tr(context)} 01557712317',
                            style: Styles.textStyle12.copyWith(fontSize: 10)),
                        Text("${StringManager.date.tr(context)} 15/101993",
                            style: Styles.textStyle12.copyWith(fontSize: 10))
                      ])),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Column(children: [
                    Row(children: [
                      Text("${StringManager.serviceType.tr(context)} غيار زيت",
                          style: Styles.textStyle12.copyWith(fontSize: 10)),
                      const Spacer(),
                      Text("${StringManager.price.tr(context)} 50",
                          style: Styles.textStyle12.copyWith(fontSize: 10))
                    ]),
                    Row(children: [
                      Text(
                          '${StringManager.productType.tr(context)} زيت شيل 05W40',
                          style: Styles.textStyle12.copyWith(fontSize: 10)),
                      const Spacer(),
                      Text("${StringManager.price.tr(context)} 1200",
                          style: Styles.textStyle12.copyWith(fontSize: 10))
                    ])
                  ])),
              const Divider(thickness: .08, color: AppColors.black, height: .1),
              const Gap(10),
              Padding(
                  padding: const EdgeInsetsDirectional.only(start: 15),
                  child: Text('${StringManager.total.tr(context)} 1250',
                      style: Styles.textStyle12.copyWith(fontSize: 10)))
            ])));
  }
}