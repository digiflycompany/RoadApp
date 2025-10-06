import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_cubit.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_state.dart';
import '../../../../../core/helpers/app_assets.dart';
import 'name_client_drop_down.dart';

class ProcessDataFields extends StatelessWidget {
  const ProcessDataFields({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessModelsCubit, BusinessModelsState>(
      builder: (context, state) {
        var cubit = BusinessModelsCubit.get(context);

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// ---- Client / Supplier Name ----
              _LabeledField(
                label: cubit.selectedRadio == 3
                    ? StringManager.supplierName.tr(context)
                    : StringManager.clientName.tr(context),
                child: SizedBox(
                  width: 120.w,
                  child: NameClientRegularDropDown(
                    hint: StringManager.clientName.tr(context),
                    licensePlateNumber: false,
                  ),
                ),
              ),

              SizedBox(width: 15.w),

              /// ---- Bill / Bond Date ----
              _LabeledField(
                label: cubit.selectedRadio == 3
                    ? StringManager.billDate.tr(context)
                    : StringManager.bondDate.tr(context),
                child: GestureDetector(
                  onTap: () => cubit.pickupDebenturesDate(context),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: const Color(0xFFF9F9F9),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat("yyyy/MM/dd").format(cubit.dateTime),
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: const Color(0xFFAAAAAA),
                          ),
                        ),
                        SvgPicture.asset(
                          AppAssets.calenderIcon,
                          width: 14.w,
                          height: 14.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// small reusable widget for cleaner UI
class _LabeledField extends StatelessWidget {
  final String label;
  final Widget child;

  const _LabeledField({
    required this.label,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$label:",
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 10,
          ),
        ),
        SizedBox(width: 5.w),
        child,
      ],
    );
  }
}
