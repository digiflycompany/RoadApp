import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/modules/coupons_and_gifts/views/widgets/coupon_icon.dart';
import 'package:roadapp2/shared/widgets/custom_appbar.dart';

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
                    Column(
                      children: [
                        Row(
                          children: [
                            Text('اسم المركز',
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600
                            ),
                            )
                          ],
                        ),
                      ],
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
