import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/service_country/views/widgets/available_country.dart';
import 'package:roadapp/features/service_country/views/widgets/soon_country.dart';

class CountriesGrid extends StatelessWidget {
  const CountriesGrid({super.key});

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
                  return const AvailableCountry();
                } else {
                  return const SoonCountry();
                }
              },
              itemCount: 9)
        ]));
  }
}