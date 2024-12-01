import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_cubit.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_state.dart';
import 'package:roadapp/features/business_models/presentation/views/widgets/process_data_field.dart';

import '../../../../../core/helpers/app_assets.dart';
import 'name_client_drop_down.dart';

class ProcessDataFields extends StatelessWidget {
  const ProcessDataFields({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * .10,
      child: BlocBuilder<BusinessModelsCubit, BusinessModelsState>(
        builder: (context, state) {
          var cubit = BusinessModelsCubit.get(context);
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisCount: 2,
            // crossAxisSpacing: 0,
            // mainAxisSpacing: 3,
            // childAspectRatio: 4,
            children: [
              // Text(
              //     cubit.selectedRadio == 1
              //         ? '${StringManager.billNumber.tr(context)}:'
              //         : '${StringManager.bondNumber.tr(context)}:',
              //     style: const TextStyle(
              //         fontWeight: FontWeight.w400, fontSize: 10)),
              // const ProcessDataField(),



              Row(
                children: [
                  Text(
                      cubit.selectedRadio == 2
                          ? '${StringManager.supplierName.tr(context)}:'
                          : '${StringManager.clientName.tr(context)}:',
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 10)),

                  SizedBox(width: 5.w,),

                  SizedBox(
                    width: 100.w,
                    height: 40.h,
                    child: NameClientDropDown(
                      hint: StringManager.clientName.tr(context),
                    ),
                  ),
                ],
              ),

             const Spacer(),

              Row(
                children: [
                  Text(
                      cubit.selectedRadio == 1
                          ? '${StringManager.billDate.tr(context)}:'
                          : '${StringManager.bondDate.tr(context)}:',
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 10)),

                  SizedBox(width: 5.w,),
                  SizedBox(
                      width: 100.w,
                      height: 40.h,
                      child: GestureDetector(
                        onTap: () {
                          cubit.pickupDate(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.w,
                            vertical: 5.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: const Color(0xFFF9F9F9),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "${cubit.dateTime.year} / ${cubit.dateTime.month} / ${cubit.dateTime.day}",
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      color: const Color(0xFFAAAAAA))),
                              SvgPicture.asset(AppAssets.calenderIcon,
                                  width: 12.w, height: 12.h)
                            ],
                          ),
                        ),
                      ),
                  ),
                ],
              ),



              // const ProcessDataField(),
              //Text(
              // cubit.selectedRadio == 2
              //     ? '${StringManager.supplierCode.tr(context)}: '
              //     : '${StringManager.clientCode.tr(context)}: ',
              // style: const TextStyle(
              //     fontWeight: FontWeight.w400, fontSize: 10)),
              // const ProcessDataField(),
              // Text(
              //     cubit.selectedRadio == 3
              //         ? '${StringManager.billType.tr(context)}: '
              //         : '${StringManager.bondType.tr(context)}: ',
              //     style: const TextStyle(
              //         fontWeight: FontWeight.w400, fontSize: 10)),
              // const ProcessDataField()
            ],
          );
        },
      ),
    );
  }
}
