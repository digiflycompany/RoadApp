import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/helpers/string_manager.dart';

class MaintenanceReportItem extends StatelessWidget {
  const MaintenanceReportItem(
      {super.key,
      required this.name,
      required this.phoneNumber,
      required this.date,
      required this.servicesName,
      required this.servicesPrice,
      required this.productsName,
      required this.productsPrice,
      required this.totalPrice,
      required this.verified});

  final String? name;
  final String? phoneNumber;
  final String? date;
  final String? servicesName;
  final String? servicesPrice;
  final String? productsName;
  final String? productsPrice;
  final String? totalPrice;
  final bool? verified;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.27),
                borderRadius: BorderRadius.circular(4.r),
              ),
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 24),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                spacing: 5,
                children: [
                  verified == true
                      ? Text(
                          "${StringManager.serviceCenter.tr(context)} $name",
                          style: Styles.textStyle12.copyWith(
                            fontSize: 10,
                          ),
                        )
                      : const SizedBox(),
                  // const SizedBox(width: 10,),

                  verified == true
                      ? Text(
                          '${StringManager.phoneNumber.tr(context)} $phoneNumber',
                          style: Styles.textStyle12.copyWith(
                            fontSize: 10,
                          ),
                        )
                      : const SizedBox(),

                  Text(
                    "${StringManager.date.tr(context)} $date",
                    style: Styles.textStyle12.copyWith(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                children: [
                  Column(children: [
                    name == null
                        ? const SizedBox()
                        : Text(
                            "${StringManager.maintenanceCenters.tr(context)}: $name",
                            style: Styles.textStyle12.copyWith(fontSize: 10),
                          ),
                    //const Spacer(),
                    phoneNumber == null
                        ? const SizedBox()
                        : Text(
                            "${StringManager.phoneNumber.tr(context)}: $phoneNumber",
                            style: Styles.textStyle12.copyWith(fontSize: 10),
                          ),
                  ]),
                  if (servicesName != null || servicesPrice != null)
                    Row(children: [
                      Text(
                        "${StringManager.serviceType.tr(context)}  $servicesName",
                        style: Styles.textStyle12.copyWith(fontSize: 10),
                      ),
                      const Spacer(),
                      Text(
                        "${StringManager.price.tr(context)} $servicesPrice",
                        style: Styles.textStyle12.copyWith(fontSize: 10),
                      ),
                    ]),
                  if (productsName != null || productsPrice != null)
                    Row(
                      children: [
                        Text(
                          '${StringManager.productType.tr(context)}  $productsName',
                          style: Styles.textStyle12.copyWith(fontSize: 10),
                        ),
                        const Spacer(),
                        Text(
                          "${StringManager.price.tr(context)} $productsPrice",
                          style: Styles.textStyle12.copyWith(fontSize: 10),
                        ),
                      ],
                    )
                ],
              ),
            ),
            const Divider(thickness: .08, color: AppColors.black, height: .1),
            const Gap(10),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 15,
              ),
              child: Text(
                '${StringManager.total.tr(context)} $totalPrice',
                style: Styles.textStyle12.copyWith(
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
