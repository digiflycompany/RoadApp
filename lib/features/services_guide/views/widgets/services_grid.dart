import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../maintenance_service/views/widgets/maintenance_service_item.dart';
import '../cubit/maintenance_service_type_cubit.dart';

class ServicesGrid extends StatelessWidget {
  const ServicesGrid({super.key, this.controller, required this.cubit});

  final MaintenanceServiceTypeVendorCubit cubit;

  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      child: GridView.builder(
        controller: controller,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 150.h,
            crossAxisCount: width < 500 ? 3 : 6,
            mainAxisSpacing: 20.h),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaintenanceServiceItem(
              title: cubit.serviceType![index].name!,
            ),
          );
        },
        itemCount: cubit.serviceType!.length,
      ),
    );
  }
}
