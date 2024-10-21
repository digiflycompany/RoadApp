import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/service_sector/views/widgets/available_sector.dart';
import 'package:roadapp/features/service_sector/views/widgets/soon_sector.dart';

class SectorsGrid extends StatelessWidget {
  const SectorsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: .845,
                  crossAxisCount: 2,
                  crossAxisSpacing: 25.w,
                  mainAxisSpacing: 25.h),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const AvailableSector();
                } else {
                  return const SoonSector();
                }
              },
              itemCount: 9)
        ]));
  }
}