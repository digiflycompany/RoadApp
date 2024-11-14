import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/maintenance_service/cubit/maintenance_service_type_cubit.dart';
import 'package:roadapp/features/maintenance_service/views/widgets/maintenance_service_item.dart';

import '../../../../core/helpers/navigation/navigation.dart';
import '../../../maintenance_centers/presentation/views/screens/maintenance_centers.dart';

class MaintenanceServicesGrid extends StatelessWidget {
  const MaintenanceServicesGrid({super.key, required this.cubit, this.maintenanceTypeList, required this.scrollController, required this.brandId, });

  final MaintenanceServiceTypeCubit cubit ;
  final dynamic maintenanceTypeList ;
  final  ScrollController scrollController;

  final String brandId ;
  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      controller: scrollController,
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 150.h,
        crossAxisCount: 3,
        mainAxisSpacing: 20.h,
      ),
      itemBuilder: (context, index) {
        return   Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){
              AppNavigation.navigate(
                  MaintenanceCenters(
                    brandId: brandId,
                    typeId: maintenanceTypeList[index].id,
                  ));
            },
            child: MaintenanceServiceItem(
              title: maintenanceTypeList[index].name,
            ),
          ),
        );
      },
      itemCount: maintenanceTypeList.length,
    );
  }
}
