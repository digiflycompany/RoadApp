import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/features/contact_us/views/cubit/contact_us_cubit.dart';

import '../../../../core/helpers/string_manager.dart';

class SelectProblemWidget extends StatelessWidget {
  const SelectProblemWidget({super.key, required this.cubit, required this.state});

  final ContactUsCubit cubit;
  final ContactUsState state;
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringManager.whatProblemAreYouFacing.tr(context),
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),

        if (state is SupportsTypeUsLoading)
          const Center(child: CircularProgressIndicator()),

        if (state is SupportsTypeUsSuccess)
          Column(
            children: cubit.content.map((problem) {
              return RadioListTile<String>(
                title: Text(
                  problem,
                  style: TextStyle(fontSize: 14.sp),
                ),
                value: problem,
                groupValue: cubit.selectedProblem,
                onChanged: (value) {
                  cubit.selectedProblem = value;
                  cubit.emit(SupportsTypeUsSuccess());
                },
              );
            }).toList(),
          ),
      ],
    );
  }
}