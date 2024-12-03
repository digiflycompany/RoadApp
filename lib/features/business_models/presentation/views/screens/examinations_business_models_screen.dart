import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_cubit.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_state.dart';
import 'package:roadapp/features/business_models/presentation/views/widgets/bill_data.dart';
import 'package:roadapp/core/widgets/process_type.dart';
import 'package:roadapp/features/business_models/presentation/views/widgets/examination_data.dart';

class ExaminationsBusinessModelsScreen extends StatelessWidget {
  const ExaminationsBusinessModelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        BusinessModelsCubit.get(context).licensePlateNumberController.clear();
        BusinessModelsCubit.get(context).examinationDateController.clear();
        BusinessModelsCubit.get(context).examinationTypeController.clear();
        BusinessModelsCubit.get(context).priceFullScanController.clear();
        BusinessModelsCubit.get(context).notesController.clear();
        BusinessModelsCubit.get(context).pointValues.clear();
      },
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(text: StringManager.businessModels.tr(context))),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: BlocBuilder<BusinessModelsCubit, BusinessModelsState>(
              builder: (context, state) {
                var cubit = BusinessModelsCubit.get(context);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    const ProcessType(bonds: false),
                    SizedBox(height: 20.h),
                    if (cubit.selectedRadio != 3) const ExaminationData(),
                    if (cubit.selectedRadio == 3) const BillData(),
                    SizedBox(height: 35.h)
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
