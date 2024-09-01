import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/modules/products_guide/views/screens/products_guide_screen.dart';
import 'package:roadapp/modules/services_guide/views/screens/services_guide_screen.dart';
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
          child: const CustomAppBar(text: 'دليل الخدمات والمنتجات')),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: ()=>AppNavigation.navigate(const ServicesGuideScreen()),
                child: Container(
                  height: 55.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.yellowColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: const Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        'دليل الخدمات',
                        style: TextStyle(
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h,),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: ()=>AppNavigation.navigate(const ProductsGuideScreen()),
                child: Container(
                  height: 55.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.yellowColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: const Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        'دليل المنتجات',
                        style: TextStyle(
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
