import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/Theming/colors.dart';

class SendTextField extends StatelessWidget {
  const SendTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, right: 14, left: 14),
      child: Row(children: [
        Container(
            decoration: BoxDecoration(
                color: AppColors.secondColor,
                borderRadius: BorderRadius.circular(50.r)),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.emoji_emotions_outlined,
                    color: AppColors.tertiary))),
        const Gap(8),
        Expanded(
            child: Container(
                decoration: BoxDecoration(
                    color: AppColors.greyColor2.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(15.r)),
                child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: [
                      TextFormField(
                          cursorColor: AppColors.secondColor,
                          decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.fromLTRB(
                                  20.0, 10.0, 20.0, 10.0),
                              border: InputBorder.none)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.attach_file, color: AppColors.greyColor))
                    ]))),
        const Gap(8),
        Container(
            decoration: BoxDecoration(
                color: AppColors.secondColor,
                borderRadius: BorderRadius.circular(50.r)),
            child: IconButton(
                onPressed: () {},
                icon:
                const Icon(Icons.send, color: AppColors.tertiary)))
      ])
    );
  }
}
