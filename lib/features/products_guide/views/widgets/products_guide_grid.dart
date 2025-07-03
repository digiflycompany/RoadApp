import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/services_guide/views/widgets/service_item.dart';

import '../../../maintenance_service/views/widgets/maintenance_service_item.dart';
import '../cubit/product_basket_cubit.dart';
import '../screens/products_guide_screen.dart';


class ProductsGuideGrid extends StatelessWidget {
  const ProductsGuideGrid({super.key, required this.cubit, this.controller});

  final ProductBasketCubit cubit;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      child: GridView.builder(
        controller: controller,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 150.h,
          crossAxisCount: width < 500 ? 3 : 6,
          mainAxisSpacing: 20.h,
        ),
        itemCount: cubit.productType!.length,
        itemBuilder: (context, index) {
          var product = cubit.productType![index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProductItem(
              id: product.id,
              name: product.name!,
              originalPrice: double.parse(product.price!.originalPrice.toString()),
              finalPrice: double.parse(product.price!.finalPrice.toString()),
              availableQuantity: int.parse(product.availableQuantity.toString()),
            ),
          );
        },
      ),
    );
  }
}

// class ProductsGuideGrid extends StatelessWidget {
//   const ProductsGuideGrid({super.key, required this.cubit, this.controller});
//
//   final ProductBasketCubit cubit;
//
//   final ScrollController? controller;
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     return Expanded(
//       child: GridView.builder(
//         controller: controller,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             mainAxisExtent: 150.h,
//             crossAxisCount: width < 500 ? 3 : 6,
//             mainAxisSpacing: 20.h),
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: MaintenanceServiceItem(
//               title: cubit.productType![index].name!,
//             ),
//           );
//         },
//         itemCount: cubit.productType!.length,
//       ),
//     );
//   }
// }
