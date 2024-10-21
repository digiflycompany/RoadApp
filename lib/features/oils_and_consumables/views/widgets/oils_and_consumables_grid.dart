import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/oils_and_consumables/views/widgets/oils_and_consumables_item.dart';

class OilsAndConsumablesGrid extends StatelessWidget {
  const OilsAndConsumablesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 150.h,
            crossAxisCount: 3,
            mainAxisSpacing: 20.h),
        itemBuilder: (context, index) {
          return const Padding(
              padding: EdgeInsets.all(8.0),
              child: OilsAndConsumablesItem());
        },
        itemCount: 9);
  }
}
