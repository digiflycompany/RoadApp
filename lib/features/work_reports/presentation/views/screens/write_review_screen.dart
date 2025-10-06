import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/theming/colors.dart';
import 'package:roadapp/core/widgets/custom_elevated_button.dart';
import 'package:roadapp/features/reserve_appointment/presentation/cubit/reserve_appointment_cubit.dart';
import 'package:roadapp/features/reserve_appointment/presentation/cubit/reserve_appointment_state.dart';

class WriteReviewScreen extends StatefulWidget {
  final String bookingId;
  const WriteReviewScreen({super.key, required this.bookingId});

  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  int employeesBehavior = 3;
  int speed = 3;
  int honesty = 3;
  int fairCost = 3;
  int efficiency = 3;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReserveAppointmentCubit, ReserveAppointmentStates>(
      listener: (context, state) {
        if (state is CreateReviewSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(StringManager.success.tr(context))),
          );
          Navigator.pop(context);
        } else if (state is CreateReviewError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    "${StringManager.error.tr(context)}: ${state.errorMessage}")),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(StringManager.writeReview.tr(context))),
          body: Padding(
            padding: EdgeInsets.all(16.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildRadioGroup(
                      StringManager.employeesBehaviour.tr(context),
                      employeesBehavior,
                      (v) => setState(() => employeesBehavior = v)),
                  _buildRadioGroup(StringManager.serviceSeed.tr(context), speed,
                      (v) => setState(() => speed = v)),
                  _buildRadioGroup(
                      StringManager.professionalHonesty.tr(context),
                      honesty,
                      (v) => setState(() => honesty = v)),
                  _buildRadioGroup(StringManager.fairPrice.tr(context),
                      fairCost, (v) => setState(() => fairCost = v)),
                  _buildRadioGroup(
                      StringManager.professionalCompetence.tr(context),
                      efficiency,
                      (v) => setState(() => efficiency = v)),
                  SizedBox(height: 20.h),
                  state is CreateReviewLoading
                      ? const Center(child: CircularProgressIndicator())
                      : CustomButton(
                          onTap: () {
                            context
                                .read<ReserveAppointmentCubit>()
                                .createReview(
                                  bookingId: widget.bookingId,
                                  employeesBehavior: employeesBehavior,
                                  speed: speed,
                                  honesty: honesty,
                                  fairCost: fairCost,
                                  efficiency: efficiency,
                                );
                          },
                          widget: Text(
                            StringManager.confirm.tr(context),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.w, vertical: 14.h),
                          borderRadius: 10.r,
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// build radio group for each review category
  Widget _buildRadioGroup(
      String title, int groupValue, Function(int) onChanged) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          SizedBox(height: 6.h),
          Wrap(
            spacing: 8.w,
            children: List.generate(5, (index) {
              final value = index + 1;
              return ChoiceChip(
                label: Text(value.toString()),
                selected: groupValue == value,
                onSelected: (_) => onChanged(value),
                selectedColor: AppColors.primaryColor,
              );
            }),
          ),
        ],
      ),
    );
  }
}
