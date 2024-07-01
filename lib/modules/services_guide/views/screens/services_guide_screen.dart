import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/modules/services_guide/views/widgets/service_item.dart';
import 'package:roadapp/shared/const/app_images.dart';
import 'package:roadapp/shared/functions/general_functions.dart';
import 'package:roadapp/shared/resources/colors.dart';
import 'package:roadapp/shared/widgets/custom_appbar.dart';

class ServicesGuideScreen extends StatelessWidget {
  const ServicesGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child: const CustomAppBar(text: 'دليل الخدمات')),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
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
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                      height: 40.h,
                      width: 35.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.primaryColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 14.h),
                        child: SvgPicture.asset(
                          AppImages.addIcon,
                        ),
                      )),
                ],
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
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ServiceItem(),
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
}
