import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/coupons_and_gifts/views/widgets/coupon_details_row.dart';
import 'package:roadapp/features/coupons_and_gifts/views/widgets/coupon_background.dart';

class CouponsAndGiftsScreen extends StatelessWidget {
  const CouponsAndGiftsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child:
                CustomAppBar(text: StringManager.giftsAndCoupons.tr(context))),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(20.r),
                child: SizedBox(
                    width: double.infinity,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                              child: Stack(children: [
                            const CouponBackground(),
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20.h, horizontal: 41.w),
                                child: Row(children: [
                                  CouponDetailsColumn(
                                      firstText:
                                          StringManager.centerName.tr(context),
                                      secondText:
                                          StringManager.service.tr(context)),
                                  Gap(80.w),
                                  CouponDetailsColumn(
                                      firstText: StringManager.discountRatio
                                          .tr(context),
                                      secondText:
                                          StringManager.service.tr(context))
                                ]))
                          ]))
                        ])))));
  }
}