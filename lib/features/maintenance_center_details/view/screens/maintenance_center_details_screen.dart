import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/custom_search_row.dart';
import 'package:roadapp/core/widgets/reserve_product.dart';
import 'package:roadapp/features/accessories_center_details/presentation/view/widgets/accessories_center_details_chart.dart';
import 'package:roadapp/features/maintenance_center_details/cubit/maintenance_center_details_cubit.dart';
import 'package:roadapp/features/maintenance_center_details/view/widgets/maintenance_service_price.dart';

import '../../../../core/dependency_injection/di.dart';
import '../../../maintenance_centers/presentation/views/widgets/image_and_name_and_location_widget.dart';
import '../../data/repo/poking_product_repo.dart';

class MaintenanceCenterDetailsScreen extends StatelessWidget {
  const MaintenanceCenterDetailsScreen({
    super.key,
    this.maintenanceCenterList,
  });

  final dynamic maintenanceCenterList;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MaintenanceCenterDetailsCubit(context,getIt.get<BookingProductRepo>()),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppBar(
            text: StringManager.maintenanceService.tr(context),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Widget for displaying image, name, and location
                ImageAndNameAndLocationWidget(
                  nameCenter: maintenanceCenterList.maintenanceCenterId.name,
                  location:
                  "${maintenanceCenterList.maintenanceCenterId.address.city} - ${maintenanceCenterList.maintenanceCenterId.address.firstLine}",
                ),

                // Widget for displaying service price and phone number
                MaintenanceServicePrice(
                  price: maintenanceCenterList.cost.toString(),
                  phoneNumber: maintenanceCenterList.maintenanceCenterId.landline,
                ),

                //const CustomSearchRow(),
                SizedBox(height: 25.h),

                // Chart widget showing reviews and ratings
                AccessoriesCenterDetailsChart(
                  allRav: maintenanceCenterList.maintenanceCenterId.reviewsCount * 5,
                  employeesBehavior:
                  maintenanceCenterList.maintenanceCenterId.averageReviews.employeesBehavior * 5,
                  speed: maintenanceCenterList.maintenanceCenterId.averageReviews.speed * 5,
                  honesty: maintenanceCenterList.maintenanceCenterId.averageReviews.honesty * 5,
                  fairCost: maintenanceCenterList.maintenanceCenterId.averageReviews.fairCost * 5,
                  efficiency: maintenanceCenterList.maintenanceCenterId.averageReviews.efficiency * 5,
                ),

                Gap(10.h),
                const ReserveProduct(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}