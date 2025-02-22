import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/app_regex.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_cubit.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_state.dart';
import '../../../../../core/Theming/styles.dart';
import 'examination_text_field.dart';

class ExaminationGrid extends StatelessWidget {
  const ExaminationGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessModelsCubit, BusinessModelsState>(
      builder: (context, state) {
        var cubit = BusinessModelsCubit.get(context);
        return Form(
          key: cubit.formKeyFullScan,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ExaminationTextField(
                      hintText: 'ABC 123',
                      label: StringManager.licensePlateNumber.tr(context),
                      controller: cubit.licensePlateNumberController,
                      validator: (value){
                        if(value != AppRegex.isPlateNumberValid(value!)){
                          return '6-10 رموز تحتوي على أرقام أو حروف عربية/إنجليزية';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 10.h),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringManager.examinationType.tr(context),
                          style: Styles.textStyle12,

                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        DropdownButtonFormField<String>(
                          hint: Text(StringManager.examinationType.tr(context),style: const TextStyle(fontSize: 12),),
                          value: cubit.selectedExaminationType,
                          items: cubit.examinationTypes.map((String type) {
                            return DropdownMenuItem<String>(
                              value: type,
                              child: Text(type,style: const TextStyle(fontSize: 9),),
                            );
                          }).toList(),
                          onChanged: (value) {
                            cubit.changeExaminationType(value!);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
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
                          Text(StringManager.examinationDate.tr(context),
                              style: Styles.textStyle12),
                          SizedBox(height: 8.h),
                          Container(
                            height: 50.h,
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 5.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: Colors.grey[200],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${cubit.dateTime.year} / ${cubit.dateTime.month} / ${cubit.dateTime.day}",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: const Color(0xFFAAAAAA)),
                                ),
                                Icon(Icons.calendar_today, size: 20),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10.h),
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
        );
      },
    );
  }
}
