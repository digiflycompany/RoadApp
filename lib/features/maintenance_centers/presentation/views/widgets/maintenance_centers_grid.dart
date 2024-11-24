import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/maintenance_centers/presentation/views/widgets/maintenance_center_item.dart';

import '../../cubit/maintenance_cubit.dart';

class MaintenanceCentersGrid extends StatelessWidget {
  const MaintenanceCentersGrid(
      {super.key, required this.cubit, this.maintenanceCenterList, this.controller});

  final MaintenanceCubit cubit;
  final ScrollController? controller;

  final dynamic maintenanceCenterList;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width,
        height = MediaQuery.of(context).size.height;
    return Expanded(
      child: GridView.builder(
        controller: controller,
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: height >= 1000 ? (height >= 1200 ? 216.2 : 210) : 180,
          mainAxisSpacing: 10.h,
          crossAxisCount: width >= 500 ? 4 : 2,
        ),
        itemBuilder: (context, index) {
          return  Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaintenanceCenterItem(
              maintenanceCenterList: maintenanceCenterList[index],
            ),
          );
        },
        itemCount: maintenanceCenterList.length,
      ),
    );
  }
}
