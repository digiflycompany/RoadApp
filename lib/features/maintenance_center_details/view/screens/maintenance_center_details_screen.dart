import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/custom_search_row.dart';
import 'package:roadapp/core/widgets/reserve_product.dart';
import 'package:roadapp/features/accessories_center_details/presentation/view/widgets/accessories_center_details_chart.dart';
import 'package:roadapp/features/accessories_center_details/presentation/view/widgets/accessories_image.dart';
import 'package:roadapp/features/maintenance_center_details/cubit/maintenance_center_details_cubit.dart';
import 'package:roadapp/features/maintenance_center_details/view/widgets/maintenance_service_price.dart';

class MaintenanceCenterDetailsScreen extends StatelessWidget {
  const MaintenanceCenterDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => MaintenanceCenterDetailsCubit(context),
        child: Scaffold(
                  appBar: PreferredSize(
                      preferredSize: preferredSize,
                      child: CustomAppBar(
                          text: StringManager.maintenanceService.tr(context))),
                  body: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            const AccessoriesImage(),
                            const MaintenanceServicePrice(),
                            const CustomSearchRow(),
                            SizedBox(height: 25.h),
                            const AccessoriesCenterDetailsChart(),
                            Gap(10.h),
                            const ReserveProduct()
                          ])))));
  }
}