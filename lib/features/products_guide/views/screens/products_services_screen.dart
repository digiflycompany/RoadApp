import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/products_guide/views/screens/products_guide_screen.dart';
import 'package:roadapp/features/products_guide/views/widgets/go_to_products_guide.dart';
import 'package:roadapp/features/products_guide/views/widgets/go_to_services_guide.dart';
import 'package:roadapp/features/services_guide/views/cubit/maintenance_service_type_cubit.dart';

import '../../../../core/helpers/navigation/navigation.dart';
import '../../../services_guide/views/screens/services_guide_screen.dart';
import '../cubit/product_basket_cubit.dart';

class ProductsServicesScreen extends StatelessWidget {
  const ProductsServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child: CustomAppBar(
              text: StringManager.servicesAndProductsGuide.tr(context))),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
        child: Column(
          children: [

            BlocBuilder<
                MaintenanceServiceTypeVendorCubit,
                MaintenanceServiceTypeVendorState>(
              builder: (context, state) {
                final cubit = MaintenanceServiceTypeVendorCubit.get(context);
                return GoToServicesGuide(
                  onTap: () {
                    cubit.fetchMaintenanceServiceType();
                    AppNavigation.navigate(const ServicesGuideScreen());
                  },);
              },
            ),


            SizedBox(height: 30.h),


            BlocBuilder<ProductBasketCubit, ProductBasketState>(
              builder: (context, state) {
                final cubit = ProductBasketCubit.get(context);
                return GoToProductsGuide(
                  onTap: (){
                    cubit.fetchProductType();
                    AppNavigation.navigate(const ProductsGuideScreen());

                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
