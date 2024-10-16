import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/functions/general_functions.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/features/accessories_center_details/view/widgets/accessories_center_details_chart.dart';
import 'package:roadapp/features/accessories_center_details/view/widgets/accessories_data.dart';
import 'package:roadapp/features/accessories_center_details/view/widgets/accessories_image.dart';
import 'package:roadapp/features/accessories_center_details/view/widgets/accessories_search_row.dart';
import 'package:roadapp/features/maintenance_center_details/cubit/maintenance_center_details_cubit.dart';
import 'package:roadapp/features/maintenance_center_details/cubit/maintenance_center_details_states.dart';

class AccessoriesCenterDetailsScreen extends StatelessWidget {
  const AccessoriesCenterDetailsScreen({super.key});

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
                child: CustomAppBar(text: StringManager.accessories.tr(context))),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AccessoriesImage(),
                    const AccessoriesData(),
                    const AccessoriesSearchRow(),
                    SizedBox(height: 25.h),
                    const AccessoriesCenterDetailsChart(),
                    Gap(
                     10.h
                    ),
                    const ReserveProduct()
                  ]
                )
              )
            )
          );
        }
      )
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
                  AppAssets.wrench)),
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
