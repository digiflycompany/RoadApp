import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';
import 'package:roadapp/features/services_guide/views/widgets/search_row.dart';
import 'package:roadapp/features/services_guide/views/widgets/services_grid.dart';
import '../cubit/maintenance_service_type_cubit.dart';

class ServicesGuideScreen extends StatefulWidget {
  const ServicesGuideScreen({super.key});

  @override
  State<ServicesGuideScreen> createState() => _ServicesGuideScreenState();
}

class _ServicesGuideScreenState extends State<ServicesGuideScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.position.atEdge) {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        _loadMoreData();
      }
    }
  }

  void _loadMoreData() {
    var cubit = context.read<MaintenanceServiceTypeVendorCubit>();
    if (cubit.state is! ServicesTypeLoadingMoreState) {
      cubit.fetchMaintenanceServiceType(
          page: cubit.maintenancePage + 1, more: true);
    }
    // cubit.fetchMaintenanceServiceType(
    //     page: cubit.maintenancePage + 1, more: true);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child: CustomAppBar(text: StringManager.servicesGuide.tr(context))),
      body: BlocBuilder<MaintenanceServiceTypeVendorCubit,
          MaintenanceServiceTypeVendorState>(
        builder: (context, state) {
          var cubit = MaintenanceServiceTypeVendorCubit.get(context);
          return Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              children: [
                SearchRow(
                  onChanged: (val) {
                    cubit.searchMaintenanceServiceType(searchField: val);
                  },
                ),
                SizedBox(height: 30.h),
                state is ServicesTypeLoadingState ||
                        state is SearchServicesTypeLoadingState
                    ? const Expanded(
                        child: Center(
                          child: CustomLoadingIndicator(),
                        ),
                      )
                    : state is ServicesTypeErrorState ||
                            state is SearchServicesTypeErrorState  ||
                            cubit.serviceType == null
                        ? const Expanded(
                            child: Center(
                              child: Text('Error'),
                            ),
                          )
                        : ServicesGrid(
                            controller: scrollController,
                            cubit: cubit,
                          ),
                SizedBox(
                  height: 10.h,
                ),
                state is ServicesTypeLoadingMoreState
                    ? const Center(
                        child: CustomLoadingIndicator(
                          height: 20,
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          );
        },
      ),
    );
  }
}
