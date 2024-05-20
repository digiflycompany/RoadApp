import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/modules/spare_parts/views/widgets/spare_parts_item.dart';
import 'package:roadapp2/shared/functions/general_functions.dart';

import '../../../../shared/resources/colors.dart';
import '../../../../shared/widgets/custom_appbar.dart';

class SparePartsScreen extends StatelessWidget {
  const SparePartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child: const CustomAppBar(text: 'قطع الغيار')),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.greyColor2.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10.r)),
                child: TextField(
                  onTapOutside: (v) => GeneralFunctions.hideKeyboard(),
                  decoration: InputDecoration(
                    contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    hintText: "بحث",
                    hintStyle: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFFAAAAAA).withOpacity(0.5)),
                    border: InputBorder.none,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 150.h,
                  crossAxisCount: 3,
                  mainAxisSpacing: 20.h,
                ),
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SparePartsItem(),
                  );
                },
                itemCount: 9,
              )
            ],
          ),
        ),
      ),
    );
  }

}
