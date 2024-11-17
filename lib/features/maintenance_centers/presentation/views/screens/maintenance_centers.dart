import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';
import 'package:roadapp/features/maintenance_centers/data/repo/maintenance_center_repo.dart';
import 'package:roadapp/features/maintenance_centers/presentation/cubit/maintenance_state.dart';
import 'package:roadapp/features/maintenance_centers/presentation/views/widgets/maintenance_centers_grid.dart';
import 'package:roadapp/features/maintenance_centers/presentation/views/widgets/maintenance_filter.dart';

import '../../../../../core/Theming/colors.dart';
import '../../../../../core/dependency_injection/di.dart';
import '../../cubit/maintenance_cubit.dart';

class MaintenanceCenters extends StatefulWidget {
  const MaintenanceCenters(
      {super.key, required this.brandId, required this.typeId});

  final String brandId;
  final String typeId;

  @override
  State<MaintenanceCenters> createState() => _MaintenanceCentersState();
}

class _MaintenanceCentersState extends State<MaintenanceCenters> {
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: CustomAppBar(
          text: StringManager.coolingCycleMaintenance.tr(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<MaintenanceCubit, MaintenanceState>(
          listener: (context, state) {

          },
          builder: (context, state) {
            var cubit = MaintenanceCubit.get(context);


            var maintenanceCenterList =
                cubit.maintenanceCenterModel?.data?.services ?? [];

            scrollController.addListener(() {
              if (scrollController.position.pixels >=
                      scrollController.position.maxScrollExtent &&
                  state is! GetMaintenanceCenterLoading) {
                cubit.loadMoreMaintenanceCenter(
                    widget.brandId, widget.typeId);
              }
            });
            return state is GetMaintenanceCenterLoading
                ? const CustomLoadingIndicator()
                : SingleChildScrollView(
                    child: Column(
                      children: [
                         MaintenanceFilter(
                          brandId: widget.brandId,
                           typeId: widget.typeId,
                        ),
                        MaintenanceCentersGrid(
                          controller: scrollController,
                          cubit: cubit,
                          maintenanceCenterList: maintenanceCenterList,
                        ),

                        if (state is GetMaintenanceCenterMoreLoading)
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
