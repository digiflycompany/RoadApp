import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/maintenance_service/views/widgets/maintenance_service_item.dart';

class MaintenanceServicesGrid extends StatelessWidget {
  const MaintenanceServicesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 150.h, crossAxisCount: 3, mainAxisSpacing: 20.h),
        itemBuilder: (context, index) {
          return const Padding(
              padding: EdgeInsets.all(8.0), child: MaintenanceServiceItem());
        },
        itemCount: 9);
  }
}