import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_cubit.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_state.dart';
import 'package:roadapp/features/business_models/presentation/views/widgets/examination_text_field.dart';

import '../../../../../core/Theming/styles.dart';
import '../../../../../core/helpers/app_assets.dart';

class ExaminationGrid extends StatelessWidget {
  const ExaminationGrid({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<BusinessModelsCubit, BusinessModelsState>(
      builder: (context, state) {
        var cubit = BusinessModelsCubit.get(context);
        return Form(
          key: cubit.formKeyFullScan,
          child: SizedBox(
            // height: 210,
            child: Column(
              // childAspectRatio: width > 500 ? 5.5 : 1.4,
              // crossAxisSpacing: 1,
              // scrollDirection: Axis.vertical,
              // crossAxisCount: 2,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ExaminationTextField(
                        label: StringManager.licensePlateNumber.tr(context),
                        controller: cubit.licensePlateNumberController,
                      ),
                    ),
                    SizedBox(
                      width: 10.h,
                    ),
                    Expanded(
                      child: ExaminationTextField(
                        label: StringManager.examinationType.tr(context),
                        controller: cubit.examinationTypeController,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          cubit.pickupDate(context);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringManager.examinationDate.tr(context),
                              style: Styles.textStyle12,
                            ),
                            SizedBox(height: 8.h),
                            Container(
                              height: 50.h,
                              padding: EdgeInsets.symmetric(
                                horizontal: 5.w,
                                vertical: 5.h,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color:  Colors.grey[200],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "${cubit.dateTime.year} / ${cubit.dateTime.month} / ${cubit.dateTime.day}",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: const Color(0xFFAAAAAA))),
                                  SvgPicture.asset(AppAssets.calenderIcon,
                                      width: 20.w, height: 20.h)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Expanded(
                    //   child: ExaminationTextField(
                    //     label: StringManager.examinationDate.tr(context),
                    //     controller: cubit.examinationDateController,
                    //   ),
                    // ),
                    SizedBox(
                      width: 10.h,
                    ),
                    Expanded(
                      child: ExaminationTextField(
                        label: StringManager.price.tr(context),
                        keyboardType: TextInputType.number,
                        controller: cubit.priceFullScanController,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
