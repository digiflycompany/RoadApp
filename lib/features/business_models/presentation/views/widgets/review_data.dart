import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_cubit.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_state.dart';

class ReviewData extends StatelessWidget {
  const ReviewData({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      BlocBuilder<BusinessModelsCubit, BusinessModelsState>(
          builder: (context, state) {
        var cubit = BusinessModelsCubit.get(context);
        return Checkbox(
            value: cubit.checked,
            onChanged: (bool? value) => cubit.toggleCheckBox());
      }),
      Text(StringManager.pleaseReviewDataBeforeSubmitting.tr(context),
          style: TextStyle(color: Colors.grey, fontSize: 11.sp))
    ]);
  }
}