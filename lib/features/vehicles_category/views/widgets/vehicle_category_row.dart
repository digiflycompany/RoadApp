import 'package:flutter/material.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/features/vehicles_category/views/widgets/vehicles_category_item.dart';

class VehicleCategoryRow extends StatelessWidget {
  const VehicleCategoryRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(children: [
      Expanded(
          child: Column(children: [
        VehiclesCategoryItem(
            image: AppAssets.coloredCar, title: "سيارات ملاكي"),
        SizedBox(height: 14),
        VehiclesCategoryItem(image: AppAssets.bike, title: "دراجات نارية"),
        SizedBox(height: 14),
        VehiclesCategoryItem(image: AppAssets.truck, title: "نقل ثقيل")
      ])),
      SizedBox(width: 10),
      Expanded(
          child: Column(children: [
        VehiclesCategoryItem(image: AppAssets.bus, title: "حافلات"),
        SizedBox(height: 15),
        VehiclesCategoryItem(image: AppAssets.lorry, title: "نقل خفيف"),
        SizedBox(height: 15),
        VehiclesCategoryItem(image: AppAssets.winch, title: "المعدات الثقيلة")
      ]))
    ]);
  }
}