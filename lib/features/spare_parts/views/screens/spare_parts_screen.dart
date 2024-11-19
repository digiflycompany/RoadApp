import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/search_row.dart';
import 'package:roadapp/features/spare_parts/cubit/spare_parts_type_cubit.dart';
import 'package:roadapp/features/spare_parts/data/repo/spare_parts_type_repo.dart';
import 'package:roadapp/features/spare_parts/views/widgets/spare_parts_grid.dart';

import '../../../../core/Theming/colors.dart';
import '../../../../core/dependency_injection/di.dart';
import '../../../../core/helpers/functions/toast.dart';
import '../../../../core/widgets/custom_loading_indicator.dart';

class SparePartsScreen extends StatelessWidget {
  const SparePartsScreen(
      {super.key, required this.countries, required this.carBrandId});

  final String countries;
  final String carBrandId;

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return BlocProvider(
      create: (BuildContext context) =>
          SparePartsTypeCubit(getIt.get<SparePartsTypeRepo>())
            ..getProductType(),
      child: PopScope(
        canPop: true,
        onPopInvokedWithResult: (didPop, result) {
          context.read<SparePartsTypeCubit>().currentPage = 1;
        },
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(
              text: StringManager.maintenanceService.tr(context),
            ),
          ),
          body: BlocConsumer<SparePartsTypeCubit, SparePartsTypeState>(
            listener: (context, state) {
              if (state is GetProductTypeError) {
                showToast(
                    message: StringManager.noInternetPleaseTryAgain,
                    state: ToastStates.error);
              }

              if (state is GetProductTypeMoreError) {
                showToast(
                    message: StringManager.noInternetPleaseTryAgain,
                    state: ToastStates.error);
              }
            },
            builder: (context, state) {
              var cubit = SparePartsTypeCubit.get(context);

              var sparePartsTypeList =
                  cubit.productTypeResponse?.data.productTypes ?? [];

              scrollController.addListener(() {
                if (scrollController.position.pixels >=
                        scrollController.position.maxScrollExtent &&
                    state is! GetProductTypeLoading) {
                  cubit.loadMoreProductType();
                }
              });

              return Padding(
                padding: EdgeInsets.all(20.r),
                child: Column(
                  children: [
                    SearchRow(
                      onChanged: (val) {
                        cubit.getSearchProductType(searchField: val);
                      },
                    ),
                    SizedBox(height: 30.h),
                    state is GetProductTypeLoading
                        ? const Expanded(child: CustomLoadingIndicator())
                        : sparePartsTypeList.isNotEmpty
                            ? state is GetSearchProductTypeLoading
                                ? const CircularProgressIndicator()
                                : Expanded(
                                    child: SparePartsGrid(
                                      scrollController: scrollController,
                                      sparePartsTypeList: sparePartsTypeList,
                                      cubit: cubit,
                                    ),
                                  )
                            : const Center(
                                child: Text("Not Product Center"),
                              ),
                    if (state is GetProductTypeMoreLoading)
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(
                          color: AppColors.yellowColor2,
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
