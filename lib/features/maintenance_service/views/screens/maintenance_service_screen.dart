import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/functions/toast.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';
import 'package:roadapp/core/widgets/search_row.dart';
import 'package:roadapp/features/maintenance_service/cubit/maintenance_service_type_cubit.dart';
import 'package:roadapp/features/maintenance_service/data/repo/maintenance_service_type_repo.dart';
import 'package:roadapp/features/maintenance_service/views/widgets/maintenance_services_grid.dart';

import '../../../../core/Theming/colors.dart';
import '../../../../core/dependency_injection/di.dart';

class MaintenanceServiceScreen extends StatelessWidget {
  const MaintenanceServiceScreen(
      {super.key, required this.countries, required this.carBrandId});

  final String countries;
  final String carBrandId;

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return BlocProvider(
      create: (BuildContext context) =>
          MaintenanceServiceTypeCubit(getIt.get<MaintenanceServiceTypeRepo>())
            ..getServiceType(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: preferredSize,
          child: CustomAppBar(
            text: StringManager.maintenanceService.tr(context),
          ),
        ),
        body: BlocConsumer<MaintenanceServiceTypeCubit,
            MaintenanceServiceTypeState>(
          listener: (context,state){
            if(state is GetSearchServiceTypeError){
              showToast(message: StringManager.noInternetPleaseTryAgain, state: ToastStates.error);
            }

            if(state is GetServiceTypeError){
              showToast(message: StringManager.noInternetPleaseTryAgain, state: ToastStates.error);
            }

            if(state is GetServiceTypeMoreError){
              showToast(message: StringManager.noInternetPleaseTryAgain, state: ToastStates.error);
            }
          },
          builder: (context, state) {
            var cubit = MaintenanceServiceTypeCubit.get(context);

            var maintenanceTypeList =
                cubit.serviceTypeResponse?.data.serviceTypes ?? [];

            scrollController.addListener(() {
              if (scrollController.position.pixels >=
                      scrollController.position.maxScrollExtent &&
                  state is! GetServiceTypeMoreLoading) {
                cubit.loadMoreServiceType();
              }
            });

            return state is GetServiceTypeLoading
                ? const CustomLoadingIndicator()
                : Padding(
                    padding: EdgeInsets.all(20.r),
                    child: Column(
                      children: [
                        SearchRow(
                          onChanged: (val) {
                            cubit.searchServiceType(searchField: val);
                          },
                        ),
                        SizedBox(height: 30.h),
                        state is GetServiceTypeMoreLoading
                            ? const CustomLoadingIndicator()
                            : Expanded(
                                child: MaintenanceServicesGrid(
                                  brandId: carBrandId,
                                  scrollController: scrollController,
                                  maintenanceTypeList: maintenanceTypeList,
                                  cubit: cubit,
                                ),
                              ),

                        if (state is GetServiceTypeMoreLoading)
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
    );
  }
}
