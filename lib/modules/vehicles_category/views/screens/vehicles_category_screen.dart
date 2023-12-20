import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/modules/vehicles_category/cubit/cubit.dart';
import 'package:roadapp2/modules/vehicles_category/views/widgets/vehicles_category_item.dart';
import 'package:roadapp2/shared/const/app_images.dart';
import 'package:roadapp2/shared/widgets/custom_appbar.dart';
import 'package:roadapp2/shared/widgets/custom_button.dart';

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
                            image: AppImages.coloredCar,
                            title: "سيارات ملاكي"),
                        SizedBox(
                          height: 14,
                        ),
                        VehiclesCategoryItem(
                            image: AppImages.bike, title: "دراجات نارية"),
                        SizedBox(
                          height: 14,
                        ),
                        VehiclesCategoryItem(
                            image: AppImages.truck, title: "نقل ثقيل"),
                      ],
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        VehiclesCategoryItem(
                            image: AppImages.bus, title: "حافلات"),
                        SizedBox(
                          height: 15,
                        ),
                        VehiclesCategoryItem(
                            image: AppImages.lorry, title: "نقل خفيف"),
                        SizedBox(
                          height: 15,
                        ),
                        VehiclesCategoryItem(
                            image: AppImages.winch, title: "المعدات الثقيلة"),
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
