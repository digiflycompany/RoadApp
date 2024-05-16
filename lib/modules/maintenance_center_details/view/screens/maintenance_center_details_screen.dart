import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roadapp2/modules/maintenance_center_details/cubit/maintenance_center_details_cubit.dart';
import 'package:roadapp2/modules/maintenance_center_details/cubit/maintenance_center_details_states.dart';
import 'package:roadapp2/modules/maintenance_center_details/view/widgets/maintenance_center_details_chart.dart';
import 'package:roadapp2/shared/const/app_images.dart';
import 'package:roadapp2/shared/functions/general_functions.dart';

import '../../../../shared/resources/colors.dart';
import '../../../../shared/widgets/custom_appbar.dart';

class MaintenanceCenterDetails extends StatelessWidget {
  const MaintenanceCenterDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MaintenanceCenterDetailsCubit(context),
      child: BlocConsumer<MaintenanceCenterDetailsCubit,
          MaintenanceCenterDetailsStates>(
        listener:
            (BuildContext context, MaintenanceCenterDetailsStates state) {},
        builder: (BuildContext context, MaintenanceCenterDetailsStates state) {
          final cubit = context.read<MaintenanceCenterDetailsCubit>();
          return Scaffold(
            appBar: PreferredSize(
                preferredSize: preferredSize,
                child: const CustomAppBar(text: 'خدمة الصيانة')),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Image.asset(
                              height: 150.h,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              AppImages.carServiceWorker),
                          Container(
                            width: double.infinity,
                            height: 30.h,
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            color: AppColors.secondColor.withOpacity(0.56),
                            child: Row(
                              children: [
                                Text(
                                  "مركز الوكيل",
                                  style: TextStyle(
                                      fontSize: 9.sp,
                                      color: AppColors.tertiary),
                                ),
                                const Spacer(),
                                SvgPicture.asset(
                                  AppImages.pinIcon,
                                  height: 7.h,
                                  width: 7.w,
                                  colorFilter: const ColorFilter.mode(
                                      Colors.red, BlendMode.srcIn),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Container(
                                  height: 10.h,
                                  width: .7.w,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  "عباس العقاد - مدينة نصر",
                                  style: TextStyle(
                                      fontSize: 9.sp,
                                      color: AppColors.tertiary),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Row(
                        children: [
                          const Icon(Icons.phone_enabled, size: 18),
                          const SizedBox(width: 3),
                          Text(
                            "0123456789",
                            style: TextStyle(
                                fontSize: 10.sp, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "صيانة دورة التبريد",
                          style: TextStyle(
                              fontSize: 10.sp, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Text(
                          "السعر: 320 جنيه",
                          style: TextStyle(
                              fontSize: 10.sp, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "خدمات اخرى",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 11.sp),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: TextField(
                            onTapOutside: (v) =>
                                GeneralFunctions.hideKeyboard(),
                            decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color(0xFF707070).withOpacity(0.05),
                                contentPadding: const EdgeInsets.fromLTRB(
                                    20.0, 10.0, 20.0, 10.0),
                                hintText: "بحث",
                                hintStyle: TextStyle(
                                    fontSize: 12.sp, color: Colors.black),
                                border: InputBorder.none,
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                                suffixIcon: Container(
                                  margin: EdgeInsets.all(3.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: Colors.black,
                                  ),
                                  child: Transform.scale(
                                    scale: 0.5,
                                    child: SvgPicture.asset(
                                      AppImages.settingIcon,
                                      colorFilter: const ColorFilter.mode(
                                          Colors.white, BlendMode.srcIn),
                                    ),
                                  ),
                                )),
                            controller: TextEditingController(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25.h),
                    const MaintenanceCenterDetailsChart(),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFE5E5E5),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "حجز المنتج",
                            style: TextStyle(
                                fontSize: 10.sp, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    cubit.pickupDate();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 10.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: const Color(0xFFF9F9F9),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${cubit.dateTime.year} / ${cubit.dateTime.month} / ${cubit.dateTime.day}",
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: const Color(0xFFAAAAAA),
                                          ),
                                        ),
                                        SvgPicture.asset(
                                          AppImages.calenderIcon,
                                          width: 15.w,
                                          height: 15.h,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  cubit.pickupTime();
                                },
                                child: Container(
                                  width: 40.w,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 10.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: const Color(0xFFF9F9F9),
                                  ),
                                  child: Center(
                                    child: Text(
                                      cubit.timeOfDay.minute
                                          .toString()
                                          .padLeft(2, '0'),
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: const Color(0xFFAAAAAA),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: const Text(
                                  ":",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  cubit.pickupTime();
                                },
                                child: Container(
                                  width: 40.w,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 10.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: const Color(0xFFF9F9F9),
                                  ),
                                  child: Center(
                                    child: Text(
                                      cubit.timeOfDay.hourOfPeriod
                                          .toString()
                                          .padLeft(2, '0'),
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: const Color(0xFFAAAAAA),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  cubit.pickupTime();
                                },
                                child: Container(
                                  width: 40.w,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 10.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: const Color(0xFFF9F9F9),
                                  ),
                                  child: Center(
                                    child: Text(
                                      cubit.timeOfDay.period.name,
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: const Color(0xFFAAAAAA),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            height: 100.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r)),
                            child: TextFormField(
                              maxLines: 10,
                              decoration: InputDecoration(
                                suffixIcon: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5.r),
                                      margin: EdgeInsets.all(10.r),
                                      decoration: BoxDecoration(
                                          color: AppColors.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: SvgPicture.asset(
                                        AppImages.sendIcon,
                                        width: 20.w,
                                      ),
                                    ),
                                  ],
                                ),
                                filled: true,
                                fillColor:
                                    const Color(0xFF707070).withOpacity(0.05),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                border: InputBorder.none,
                              ),
                              controller: TextEditingController(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget otherServiceItem() {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
              height: 80.h,
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              width: 80.w,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20.r)),
              child: SvgPicture.asset(
                  width: 30.w,
                  height: 30.h,
                  fit: BoxFit.scaleDown,
                  AppImages.wrench)),
          SizedBox(height: 10.h),
          Text(
            "صيانة دورة التبريد",
            style: TextStyle(fontSize: 10.sp),
          ),
        ],
      ),
    );
  }
}
