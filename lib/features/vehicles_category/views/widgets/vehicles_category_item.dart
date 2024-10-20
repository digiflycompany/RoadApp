import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roadapp/features/vehicles_category/cubit/cubit.dart';
import 'package:roadapp/features/vehicles_category/cubit/states.dart';
import 'package:roadapp/core/Theming/colors.dart';

class VehiclesCategoryItem extends StatelessWidget {
  const VehiclesCategoryItem(
      {super.key, required this.image, required this.title});

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VehiclesCategoryCubit, VehiclesCategoryStates>(
        listener: (BuildContext context, VehiclesCategoryStates state) {},
        builder: (BuildContext context, VehiclesCategoryStates state) {
          return Card(
              elevation: 1.5,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(alignment: AlignmentDirectional.center, children: [
                      Container(
                          height: 115.h,
                          margin: const EdgeInsetsDirectional.all(13),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: AppColors.primaryColor)),
                      SvgPicture.asset(image, width: 40.w, height: 50.h)
                    ]),
                    Text(title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold))
                  ]));
        });
  }
}