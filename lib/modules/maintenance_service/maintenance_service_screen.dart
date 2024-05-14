import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp2/modules/maintenance_cooling/maintenance_cooling.dart';
import 'package:roadapp2/shared/const/app_images.dart';
import 'package:roadapp2/shared/functions/general_functions.dart';

import '../../services/navigation/navigation.dart';
import '../../shared/resources/colors.dart';
import '../../shared/widgets/custom_appbar.dart';

class MaintenanceServiceScreen extends StatelessWidget {
  const MaintenanceServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child: const CustomAppBar(text: 'خدمة الصيانة')),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.greyColor2.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10.r)),
                child: TextField(
                  onTapOutside: (v) => GeneralFunctions.hideKeyboard(),
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    hintText: "بحث",
                    hintStyle: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFFAAAAAA).withOpacity(0.5)),
                    border: InputBorder.none,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 150.h,
                  crossAxisCount: 3,
                  mainAxisSpacing: 20.h,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: item(context),
                  );
                },
                itemCount: 9,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget item(context) {
    return InkWell(
      onTap: () {
        AppNavigation.navigate(MaintenanceCooling());
      },
      child: Container(
        padding: EdgeInsets.only(
          top: 14.h,
          right: 9.w,
          left: 9.w,
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Color(0xFFD7D7D7),
                  blurRadius: 10,
                  offset: Offset(0, 2)),
            ],
            borderRadius: BorderRadius.circular(10.r)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                height: 80.h,
                width: 100.w,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20.r)),
                child: Transform.scale(
                  scale: 0.5,
                  child: SvgPicture.asset(
                      width: 100.w, height: 100.h, AppImages.wrench),
                )),
            SizedBox(height: 5.h),
            Expanded(
              child: Text(
                "صيانة دورة التبريد",
                style: TextStyle(fontSize: 9.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
