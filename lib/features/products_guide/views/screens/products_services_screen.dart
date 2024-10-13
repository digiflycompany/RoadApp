import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/products_guide/views/screens/products_guide_screen.dart';
import 'package:roadapp/features/services_guide/views/screens/services_guide_screen.dart';
import 'package:roadapp/core/navigation/navigation.dart';
import 'package:roadapp/core/Theming/colors.dart';

class ProductsServicesScreen extends StatefulWidget {
  const ProductsServicesScreen({super.key});

  @override
  State<ProductsServicesScreen> createState() => _ProductsServicesScreenState();
}

class _ProductsServicesScreenState extends State<ProductsServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(
                text: StringManager.servicesAndProductsGuide.tr(context))),
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
            child: Column(children: [
              GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () =>
                      AppNavigation.navigate(const ServicesGuideScreen()),
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.yellowColor,
                          borderRadius: BorderRadius.circular(10.r)),
                      padding: const EdgeInsets.all(12),
                      child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(StringManager.servicesGuide.tr(context),
                              style: Styles.textStyle16)))),
              SizedBox(height: 30.h),
              GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () =>
                      AppNavigation.navigate(const ProductsGuideScreen()),
                  child: Container(
                      height: 55.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.yellowColor,
                          borderRadius: BorderRadius.circular(10.r)),
                      padding: const EdgeInsets.all(12),
                      child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(StringManager.productsGuide.tr(context),
                              style: Styles.textStyle16))))
            ])));
  }
}