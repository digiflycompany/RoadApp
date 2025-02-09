import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/features/calendar/presentation/cubit/add_memo/add_memo_cubit.dart';
import 'package:roadapp/features/calendar/presentation/cubit/add_memo/add_memo_state.dart';

class MemoDropdown extends StatelessWidget {
  const MemoDropdown(
      {super.key,
      required this.title,
      required this.iconPath,
      required this.hint, required this.value, required this.list, this.onChanged});

  final String title, iconPath, hint, value;
  final List<String> list;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: Styles.textStyle12),
      SizedBox(height: 6.h),
      Container(
          height: 35.h,
          decoration: BoxDecoration(
              color: AppColors.greyColor3,
              borderRadius: BorderRadius.circular(6)),
          child: Row(children: [
            Transform.scale(
                scale: 0.6, child: SvgPicture.asset(iconPath, width: 35.w)),
            Gap(10.w),
            Expanded(child: DropdownButtonHideUnderline(
                child: BlocBuilder<AddMemoCubit, AddMemoState>(
              builder: (context, state) {
                return DropdownButton<String>(
                    value: value,
                    hint: Text(hint, style: Styles.textStyle12),
                    icon: const Icon(Icons.arrow_drop_down),
                    isExpanded: true,
                    items: list.map((String value) {
                      return DropdownMenuItem<String>(
                          value: value,
                          child: Container(
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(6)),
                              child: Text(value,
                                  style: Styles.textStyle12.copyWith(
                                      fontSize: 10.sp,
                                      color: AppColors.greyColor2))));
                    }).toList(),
                    onChanged: onChanged);
              },
            )))
          ]))
    ]);
  }
}