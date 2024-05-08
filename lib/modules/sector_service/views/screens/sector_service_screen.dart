import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/modules/sector_service/views/widgets/available_card.dart';
import 'package:roadapp2/modules/sector_service/views/widgets/soon_card.dart';
import 'package:roadapp2/shared/widgets/custom_appbar.dart';
import 'package:roadapp2/shared/widgets/custom_button.dart';

class SectorServiceScreen extends StatelessWidget {
  const SectorServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: const CustomAppBar(text: 'اختر قطاع الخدمة'),
      ),
      body: Padding(
        padding:
            EdgeInsets.only(top: 50.h, bottom: 20.h, right: 15.w, left: 15.w),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const ScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 170.h,
                          crossAxisCount: 2,
                          crossAxisSpacing: 25.w,
                          mainAxisSpacing: 25.h),
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return const AvailableCard();
                        } else {
                          return const SoonCard();
                        }
                      },
                      itemCount: 9,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomElevatedButton(
                onTap: () {},
                width: 200.w,
                height: 50.h,
                widget: Text(
                  "اختر",
                  style: TextStyle(fontSize: 11.sp),
                )),
          ],
        ),
      ),
    );
  }
}
