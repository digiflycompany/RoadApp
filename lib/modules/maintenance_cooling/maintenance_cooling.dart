import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/modules/maintenance_service_details/maintenance_service_details.dart';
import 'package:roadapp2/shared/const/app_images.dart';

import '../../services/navigation/navigation.dart';
import '../../shared/resources/colors.dart';
import '../../shared/widgets/custom_alert_dialog.dart';
import '../../shared/widgets/custom_appbar.dart';
import '../../shared/widgets/custom_button.dart';

// ignore: must_be_immutable
class MaintenanceCooling extends StatelessWidget {

  bool leastPriceCheckbox = false;
  bool nearestCheckbox = false;
  bool mostRatedCheckbox = false;

  MaintenanceCooling({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child: const CustomAppBar(text: 'صيانة دورة التبريد')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        showCustomAlertDialog(
                            context: context,
                            title: "الظهور حسب",
                            content: StatefulBuilder(builder: (ctxx, setState) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Flexible(
                                        child: CheckboxListTile(
                                            title: Text(
                                              'الأقل سعرا',
                                              style: TextStyle(fontSize: 10.sp),
                                            ),
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                            checkColor: Colors.black,
                                            fillColor: const MaterialStatePropertyAll(
                                                AppColors.primaryColor),
                                            contentPadding: EdgeInsets.zero,
                                            value: leastPriceCheckbox,
                                            onChanged: (val) {
                                              leastPriceCheckbox = val!;
                                              setState(() {});
                                            }),
                                      ),
                                      Flexible(
                                        child: CheckboxListTile(
                                            title: Text(
                                              'الأقرب جغرافيًا',
                                              style: TextStyle(fontSize: 10.sp),
                                            ),
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                            checkColor: Colors.black,
                                            fillColor: const MaterialStatePropertyAll(
                                                AppColors.primaryColor),
                                            contentPadding: EdgeInsets.zero,
                                            value: nearestCheckbox,
                                            onChanged: (val) {
                                              nearestCheckbox = val!;
                                              setState(() {});
                                            }),
                                      ),
                                    ],
                                  ),
                                  Flexible(
                                    child: CheckboxListTile(
                                        title: Text(
                                          'الأعلى تقييمًا',
                                          style: TextStyle(fontSize: 10.sp),
                                        ),
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        checkColor: Colors.black,
                                        fillColor: const MaterialStatePropertyAll(
                                            AppColors.primaryColor),
                                        contentPadding: EdgeInsets.zero,
                                        value: mostRatedCheckbox,
                                        onChanged: (val) {
                                          mostRatedCheckbox = val!;
                                          setState(() {});
                                        }),
                                  ),
                                  CustomElevatedButton(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      widget: Text(
                                        'اختر',
                                        style: TextStyle(
                                          fontSize: 9.sp,
                                        ),
                                      ))
                                ],
                              );
                            }));
                      },
                      icon: const Icon(EvaIcons.options2Outline)),
                ],
              ),
              GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const ScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 250.h, crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: item(context),
                  );
                },
                itemCount: 4,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget item(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          height: 100.h,
          fit: BoxFit.scaleDown,
          AppImages.carServiceWorker,
        ),
        Row(
          children: [
            Text(
              "اسم المركز",
              style: TextStyle(fontSize: 7.sp,fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              "السعر: 320 جنيه",
              style: TextStyle(fontSize: 7.sp,fontWeight: FontWeight.bold),
            ),
          ],
        ),
        RatingBarIndicator(
          rating: 5,
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          itemCount: 5,
          itemSize: 15.r,
          direction: Axis.horizontal,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              Container(
                width: 10.r,
                height: 10.r,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                "عباس العقاد - مدينة نصر",
                style: TextStyle(fontSize: 7.sp,fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 35.h,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: AppColors.primaryColor,

                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(5))),
                    ),
                    onPressed: () {
                      AppNavigation.navigate(const MaintenanceServiceDetails());
                    },
                    child: Text(
                      "للحجز والاستفسار",
                      style: TextStyle(
                          fontSize: 8.sp, color: AppColors.secondColor),
                    )),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 35.h,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                    )),
                    elevation: 0,
                  ),
                  child: Text(
                    "رقم الهاتف",
                    style:
                        TextStyle(fontSize: 8.sp, color: AppColors.secondColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
