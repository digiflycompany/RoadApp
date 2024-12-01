import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_cubit.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_state.dart';

class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(StringManager.notes.tr(context),
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
      SizedBox(height: 10.h),
      Container(
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10.r)),
          padding: EdgeInsets.all(10.w),
          child: BlocBuilder<BusinessModelsCubit, BusinessModelsState>(
            builder: (context, state) {
              var cubit = BusinessModelsCubit.get(context);

              return TextField(
                  controller: cubit.noteController,
                  maxLines: 3,
                  decoration: InputDecoration.collapsed(
                      hintText: StringManager.addYourNotes.tr(context),
                      hintStyle: TextStyle(fontSize: 12.sp)));
            },
          ))
    ]);
  }
}