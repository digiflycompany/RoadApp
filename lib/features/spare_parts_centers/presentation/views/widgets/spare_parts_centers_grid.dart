import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/spare_parts_centers/presentation/views/widgets/spare_parts_center_item.dart';

class SparePartsCentersGrid extends StatelessWidget {
  const SparePartsCentersGrid({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width,
        height = MediaQuery.of(context).size.height;
    return GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent:
                height >= 1000 ? (height >= 1200 ? 216.2 : 210) : 180,
            mainAxisSpacing: 10.h,
            crossAxisCount: width >= 500 ? 4 : 2),
        itemBuilder: (context, index) {
          return const Padding(
              padding: EdgeInsets.all(8.0), child: SparePartsCenterItem());
        },
        itemCount: 27);
  }
}