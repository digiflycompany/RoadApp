import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/custom_search_row.dart';
import 'package:roadapp/core/widgets/reserve_product.dart';
import 'package:roadapp/features/accessories_center_details/view/widgets/accessories_center_details_chart.dart';
import 'package:roadapp/features/accessories_center_details/view/widgets/accessories_image.dart';
import 'package:roadapp/features/maintenance_center_details/cubit/maintenance_center_details_cubit.dart';
import 'package:roadapp/features/maintenance_center_details/cubit/maintenance_center_details_states.dart';
import 'package:roadapp/features/oils_and_consumables_center_details/view/widgets/oil_price.dart';

class OilsAndConsumablesCenterDetailsScreen extends StatelessWidget {
  const OilsAndConsumablesCenterDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => MaintenanceCenterDetailsCubit(context),
        child: BlocConsumer<MaintenanceCenterDetailsCubit,
                MaintenanceCenterDetailsStates>(
            listener:
                (BuildContext context, MaintenanceCenterDetailsStates state) {},
            builder:
                (BuildContext context, MaintenanceCenterDetailsStates state) {
              final cubit = context.read<MaintenanceCenterDetailsCubit>();
              return Scaffold(
                  appBar: PreferredSize(
                      preferredSize: preferredSize,
                      child: CustomAppBar(
                          text: StringManager.oilsAndConsumables.tr(context))),
                  body: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            const AccessoriesImage(),
                            const OilPrice(),
                            const CustomSearchRow(),
                            SizedBox(height: 25.h),
                            const AccessoriesCenterDetailsChart(),
                            Gap(10.h),
                            const ReserveProduct()
                          ]))));
            }));
  }
}