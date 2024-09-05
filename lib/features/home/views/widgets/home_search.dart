import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_text_field.dart';
import 'package:roadapp/features/home/cubit/home_cubit.dart';
import 'package:roadapp/features/home/cubit/home_states.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/features/home/views/widgets/search_filter.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          var cubit = HomeCubit.get(context);
          return Column(children: [
            Padding(
                padding: EdgeInsets.all(16.w),
                child: SizedBox(
                    height: 48.h,
                    child: Stack(alignment: Alignment.topLeft, children: [
                      CustomTextField(
                          contentHorizontalPadding: 0,
                          suffixIcon: Container(
                              width: 50.w,
                              decoration: BoxDecoration(
                                  color: AppColors.secondColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: IconButton(
                                  color: AppColors.tertiary,
                                  iconSize: 23.r,
                                  onPressed: () {
                                    showSearchFilter(context);
                                  },
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(EvaIcons.options2Outline))),
                          hintText:
                              StringManager.whatAreUSearchingFor.tr(context),
                          controller: cubit.searchController,
                          prefixIcon: const Icon(Icons.search_sharp,
                              color: AppColors.greyColor))
                    ])))
          ]);
        });
  }
}