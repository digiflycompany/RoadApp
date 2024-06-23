import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/modules/maintenance%20_report/cubit/cubit.dart';
import 'package:roadapp/modules/maintenance%20_report/cubit/states.dart';
import 'package:roadapp/shared/const/app_images.dart';
import 'package:roadapp/shared/resources/colors.dart';
import '../../../../shared/widgets/custom_appbar.dart';

class VendorMaintenanceReportScreen extends StatefulWidget {
  const VendorMaintenanceReportScreen({super.key});

  @override
  State<VendorMaintenanceReportScreen> createState() => _VendorMaintenanceReportScreenState();
}

class _VendorMaintenanceReportScreenState extends State<VendorMaintenanceReportScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MaintenanceReportCubit>(
      create: (BuildContext context) => MaintenanceReportCubit(),
      child: BlocConsumer<MaintenanceReportCubit, MaintenanceReportStates>(
        listener: (BuildContext context, MaintenanceReportStates state) {},
        builder: (BuildContext context, MaintenanceReportStates state) {
          //var cubit = MaintenanceReportCubit.get(context);
          return Scaffold(
            appBar: PreferredSize(
                preferredSize: preferredSize,
                child: const CustomAppBar(text: 'تقارير الصيانة')),
            body: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Column(
                children: [
                 Padding(
                   padding: EdgeInsetsDirectional.only(end: 20.w),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Container(
                         width: 115.w,
                         height: 43.h,
                         decoration: BoxDecoration(
                           color: AppColors.primaryColor,
                           borderRadius: BorderRadius.only(
                             topLeft: Radius.circular(8.r),
                             bottomLeft: Radius.circular(8.r),
                           )
                                     ),
                         child: Center(
                           child: Text(
                             'جاد مرسي',
                             style: TextStyle(
                               fontWeight: FontWeight.w600,
                               fontSize: 13.sp,
                             ),
                           ),
                         ),
                       ),
                       const Spacer(),
                       SvgPicture.asset(AppImages.shareIcon,width: 20.w,),
                       SizedBox(width: 16.w,),
                       SvgPicture.asset(AppImages.filterIcon,width: 20.w,),
                     ],
                   ),
                 ),
                 SizedBox(height: 30.h,),
                 Padding(
                   padding: EdgeInsets.symmetric(horizontal: 57.w),
                   child: Container(
                     width: double.infinity,
                     height: 40.h,
                     decoration: BoxDecoration(
                       color: Colors.black,
                       borderRadius: BorderRadius.circular(8.r)
                     ),
                     child: Padding(
                       padding: EdgeInsets.symmetric(horizontal: 16.w),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text('1',
                           style: TextStyle(
                             color: Colors.white,
                             fontSize: 11.sp,
                               fontWeight: FontWeight.w500
                           ),
                           ),
                           Text('صني',
                             style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 11.sp,
                                 fontWeight: FontWeight.w500
                             ),
                           ),
                           Text('2014',
                             style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 11.sp,
                                 fontWeight: FontWeight.w500
                             ),
                           ),
                           Text('مانوال',
                             style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 11.sp,
                                 fontWeight: FontWeight.w500
                             ),
                           ),
                           Text('أ ب هـ  2 3 4 6',
                             style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 11.sp,
                                 fontWeight: FontWeight.w500
                             ),
                           ),
                         ],
                       ),
                     ),
                   ),
                 ),
                  //const VendorMaintenanceTable(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
