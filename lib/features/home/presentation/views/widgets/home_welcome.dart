import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_helper.dart';
import 'package:roadapp/core/helpers/cache_helper/cache_vars.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/Theming/styles.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';
import 'package:roadapp/features/home/presentation/cubit/home_cubit.dart';
import 'package:roadapp/features/home/presentation/cubit/home_states.dart';

class HomeWelcome extends StatelessWidget {
  const HomeWelcome({super.key});

  Future<String?> _getUserName() async {
    return await CacheHelper().getData(CacheVars.userName);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(children: [
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
          child: FutureBuilder(
              future: _getUserName(),
              builder: (context, snapshot) {
                String userName = snapshot.data ?? "";
                return Row(children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Text(StringManager.welcome.tr(context),
                              style: Styles.textStyle12),
                          SizedBox(width: 3.w),
                          SvgPicture.asset(AppAssets.wave)
                        ]),
                        Row(children: [
                          Text('$userName, ', style: Styles.textStyle12),
                          Text(StringManager.yourRoadIsSafe.tr(context),
                              style: Styles.textStyle12)
                        ])
                      ]),
                  Gap(width * .25),
                  const Icon(Icons.location_pin),
                  Flexible(child: BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        var cubit = HomeCubit.get(context);
                    return state is CountryLoadingState
                        ? const CustomLoadingIndicator(height: 15)
                        : state is CountryErrorState
                            ? Text(state.errorMessage,
                                style: Styles.textStyle12,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1)
                            : Text(cubit.countryName,
                                    style: Styles.textStyle12,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1);
                  }))
                ]);
              }))
    ]);
  }
}