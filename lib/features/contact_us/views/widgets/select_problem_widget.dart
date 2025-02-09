import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/features/contact_us/views/cubit/contact_us_cubit.dart';

import '../../../../core/helpers/string_manager.dart';

class SelectProblemWidget extends StatefulWidget {
  const SelectProblemWidget({
    super.key, required this.cubit,
  });
  final ContactUsCubit cubit;

  @override
  State<SelectProblemWidget> createState() => _SelectProblemWidgetState();
}

class _SelectProblemWidgetState extends State<SelectProblemWidget> {
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
        RadioListTile<String>(
          title: Text(
            StringManager.technicalSupport.tr(context),
            style: TextStyle(fontSize: 14.sp),
          ),
          value: 'CUSTOMER_SERVICE',
          groupValue: widget.cubit.selectedProblem,
          onChanged: (value) {
            setState(() {
              widget.cubit.selectedProblem = value;

            });
          },
        ),
        RadioListTile<String>(
          title: Text(
            StringManager.addAds.tr(context),
            style: TextStyle(fontSize: 14.sp),
          ),
          value: 'ADVERTISEMENT',
          groupValue: widget.cubit.selectedProblem,
          onChanged: (value) {
            setState(() {
              widget.cubit.selectedProblem = value;
            });
          },
        ),
      ],
    );
  }
}