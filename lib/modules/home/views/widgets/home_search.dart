import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/modules/home/cubit/home_cubit.dart';
import 'package:roadapp2/modules/home/cubit/home_states.dart';
import 'package:roadapp2/shared/resources/colors.dart';
import 'package:roadapp2/shared/widgets/custom_text_field.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, state) {
        var cubit = HomeCubit.get(context);
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.w),
              child: SizedBox(
                height: 48.h,
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    CustomTextField(
                        hintText: 'عن ماذا تبحث؟',
                        controller: cubit.searchController,
                        prefixIcon: const Icon(Icons.search_sharp,
                            color: AppColors.greyColor)),
                    Container(
                      width: 50.w,
                      decoration: BoxDecoration(
                        color: AppColors.secondColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            bottomLeft: Radius.circular(10.r)),
                      ),
                      child: IconButton(
                          color: AppColors.tertiary,
                          iconSize: 23.r,
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          icon: const Icon(EvaIcons.options2Outline)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
