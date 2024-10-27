import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/services_guide/views/widgets/service_item.dart';

class ProductsGuideGrid extends StatelessWidget {
  const ProductsGuideGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 150.h, crossAxisCount: 3, mainAxisSpacing: 20.h),
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ServiceItem(text: StringManager.product.tr(context)));
        },
        itemCount: 9);
  }
}