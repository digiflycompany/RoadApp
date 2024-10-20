import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/accessories_centers/presentation/views/widgets/accessories_center_item.dart';

class AccessoriesCenterGrid extends StatelessWidget {
  const AccessoriesCenterGrid({super.key});

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
              padding: EdgeInsets.all(8.0), child: AccessoriesCentersItem());
        },
        itemCount: 27);
  }
}