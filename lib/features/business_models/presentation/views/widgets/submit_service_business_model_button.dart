import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_cubit.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_state.dart';

class SubmitServiceBusinessModelButton extends StatelessWidget {
  const SubmitServiceBusinessModelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessModelsCubit, BusinessModelsState>(
        builder: (_, state) {
      return state is AddFullScanReportLoadingState
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.w, vertical: 7.h),
                ),
                onPressed: () {
                  final BusinessModelsCubit cubit =
                      BusinessModelsCubit.get(context);
                  if (cubit.formKeyFullScan.currentState!.validate()) {
                    cubit.createFullScanReport();
                  }
                },
                child: Text(
                  StringManager.submit.tr(context),
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 13.sp,
                  ),
                ),
              ),
            );
    });
  }
}
