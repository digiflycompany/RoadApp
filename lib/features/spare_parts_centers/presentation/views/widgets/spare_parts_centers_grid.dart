import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/spare_parts_centers/presentation/manager/spare_parts_cubit.dart';
import 'package:roadapp/features/spare_parts_centers/presentation/views/widgets/spare_parts_center_item.dart';

class SparePartsCentersGrid extends StatelessWidget {
  const SparePartsCentersGrid(
      {super.key,
      required this.cubit,
      this.controller,
      this.sparePartsCenterList, required this.carBrandId});

  final SparePartsCubit cubit;
  final ScrollController? controller;
  final String carBrandId;


  final dynamic sparePartsCenterList;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width,
        height = MediaQuery.of(context).size.height;
    return Expanded(
      child: GridView.builder(
        controller: controller,
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent:
                height >= 1000 ? (height >= 1200 ? 216.2 : 210) : 180,
            mainAxisSpacing: 10.h,
            crossAxisCount: width >= 500 ? 4 : 2),
        itemBuilder: (context, index) {
          return  Padding(
            padding: const EdgeInsets.all(8.0),
            child: SparePartsCenterItem(
              carBrandId: carBrandId,
              sparePartsCenterList: sparePartsCenterList[index],
            ),
          );
        },
        itemCount: sparePartsCenterList.length,
      ),
    );
  }
}
