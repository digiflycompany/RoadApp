import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/spare_parts/views/widgets/spare_parts_item.dart';

class SparePartsGrid extends StatelessWidget {
  const SparePartsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 150.h, crossAxisCount: 3, mainAxisSpacing: 20.h),
        itemBuilder: (context, index) {
          return const Padding(
              padding: EdgeInsets.all(8.0), child: SparePartsItem());
        },
        itemCount: 9);
  }
}