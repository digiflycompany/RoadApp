import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/modules/coupons_and_gifts/views/widgets/coupon_details_row.dart';
import 'package:roadapp/modules/coupons_and_gifts/views/widgets/coupon_icon.dart';
import 'package:roadapp/shared/widgets/custom_appbar.dart';

class CouponsAndGiftsScreen extends StatelessWidget {
  const CouponsAndGiftsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child: const CustomAppBar(text: 'هدايا وكوبونات')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    const CouponIcon(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 41.w),
                      child: Row(
                        children: [
                          const CouponDetailsColumn(firstText: 'اسم المركز', secondText: 'الخدمة',),
                          SizedBox(width: 105.w,),
                          const CouponDetailsColumn(firstText: 'نسبة الخصم', secondText: 'الخدمة',),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
