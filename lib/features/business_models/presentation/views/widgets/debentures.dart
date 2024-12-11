import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_cubit.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_state.dart';
import 'package:roadapp/features/business_models/presentation/views/screens/debentures_business_models_screen.dart';

import '../../../../../core/helpers/cache_helper/cache_helper.dart';

class Debentures extends StatelessWidget {
  const Debentures({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessModelsCubit, BusinessModelsState>(
      builder: (context, state) {
        return state is GetUserDataLoading || state is GetProductLoading || state is GetMaintenanceCentersLoading
            ? const CircularProgressIndicator()
            : GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () async {
                  var cubit = BusinessModelsCubit.get(context);
                  await cubit.fetchProducts();
                  await cubit.fetchMaintenanceCenter();
                  AppNavigation.navigate(
                    const DebenturesBusinessModelsScreen(),
                  );

                },
                child: Container(
                  height: 55.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.yellowColor,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        StringManager.bonds.tr(context),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
