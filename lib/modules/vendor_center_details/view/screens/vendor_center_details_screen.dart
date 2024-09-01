import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roadapp/core/functions/general_functions.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/modules/vendor_center_details/cubit/vendor_center_details_cubit.dart';
import 'package:roadapp/modules/vendor_center_details/cubit/vendor_center_details_states.dart';
import 'package:roadapp/modules/vendor_center_details/view/widgets/vendor_center_details_chart.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/Theming/colors.dart';

class VendorCenterDetailsScreen extends StatelessWidget {
  const VendorCenterDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VendorCenterDetailsCubit(context),
      child: BlocConsumer<VendorCenterDetailsCubit,
          VendorCenterDetailsStates>(
        listener:
            (BuildContext context, VendorCenterDetailsStates state) {},
        builder: (BuildContext context, VendorCenterDetailsStates state) {
          //final cubit = context.read<VendorCenterDetailsCubit>();
          return Scaffold(
            appBar: PreferredSize(
                preferredSize: preferredSize,
                child: const CustomAppBar(text: 'الملف الشخصي')),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 150.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Image.asset(
                                width: double.infinity,
                                fit: BoxFit.cover,
                                AppAssets.carServiceWorker),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(4.r)
                                  ),
                                  margin: EdgeInsets.all(5.r),
                                  padding: EdgeInsets.all(5.r),
                                  child: SvgPicture.asset(
                                    AppAssets.editReservationIcon,
                                    height: 15.h,
                                    colorFilter: const ColorFilter.mode(
                                        Colors.black, BlendMode.srcIn),
                                  ),
                                ),
                                Container(
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
                                        AppAssets.pinIcon,
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
                          ],
                        ),
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
                                      AppAssets.settingIcon,
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
                    const VendorCenterDetailsChart(),
                    SizedBox(
                      height: 10.h,
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
}
