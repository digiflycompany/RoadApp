import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/features/vehicles_category/cubit/cubit.dart';
import 'package:roadapp/features/vehicles_category/views/widgets/vehicles_category_item.dart';
import 'package:roadapp/core/utils/app_assets.dart';

class VehiclesCategoryScreen extends StatelessWidget {
  const VehiclesCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child: const CustomAppBar(text: 'اختر الفئة')),
      body: BlocProvider<VehiclesCategoryCubit>(
        create: (BuildContext context) => VehiclesCategoryCubit(),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 15,end:15,top:15,bottom: 8),
          child: Expanded(
            child: Column(
              children: [
                const Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        VehiclesCategoryItem(
                            image: AppAssets.coloredCar,
                            title: "سيارات ملاكي"),
                        SizedBox(
                          height: 14,
                        ),
                        VehiclesCategoryItem(
                            image: AppAssets.bike, title: "دراجات نارية"),
                        SizedBox(
                          height: 14,
                        ),
                        VehiclesCategoryItem(
                            image: AppAssets.truck, title: "نقل ثقيل"),
                      ],
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        VehiclesCategoryItem(
                            image: AppAssets.bus, title: "حافلات"),
                        SizedBox(
                          height: 15,
                        ),
                        VehiclesCategoryItem(
                            image: AppAssets.lorry, title: "نقل خفيف"),
                        SizedBox(
                          height: 15,
                        ),
                        VehiclesCategoryItem(
                            image: AppAssets.winch, title: "المعدات الثقيلة"),
                      ],
                    )),
                  ],
                ),
                const Spacer(),
                CustomElevatedButton(onTap: () {}, widget: const Text("اختر"),width: 150.w,height: 60.h,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
