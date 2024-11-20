import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/spare_parts_centers/presentation/manager/spare_parts_cubit.dart';
import 'package:roadapp/features/spare_parts_centers/presentation/manager/spare_parts_state.dart';
import 'package:roadapp/features/spare_parts_centers/presentation/views/widgets/spare_parts_centers_grid.dart';
import 'package:roadapp/features/spare_parts_centers/presentation/views/widgets/spare_parts_filter.dart';

import '../../../../../core/Theming/colors.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';

class SparePartsCenters extends StatefulWidget {
  const SparePartsCenters({super.key, required this.typeId});

  final String typeId;

  @override
  State<SparePartsCenters> createState() => _SparePartsCentersState();
}

class _SparePartsCentersState extends State<SparePartsCenters> {
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        context.read<SparePartsCubit>().currentPage = 1;
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: preferredSize,
          child: CustomAppBar(
            text: StringManager.spareParts.tr(context),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<SparePartsCubit, SparePartsState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = SparePartsCubit.get(context);

              var sparePartsCenterList =
                  cubit.sparePartsCenterResponse?.data?.products ?? [];

              scrollController.addListener(() {
                if (scrollController.position.pixels >=
                        scrollController.position.maxScrollExtent &&
                    state is! GetSparePartsCenterLoading) {
                  cubit.loadMoreSparePartsCenter(widget.typeId);
                }
              });
              return state is GetSparePartsCenterLoading
                  ? const CustomLoadingIndicator()
                  : Column(
                      children: [
                        SparePartsFilter(
                          typeId: widget.typeId,
                        ),

                        sparePartsCenterList.isNotEmpty ? SparePartsCentersGrid(
                          cubit: cubit,
                          controller: scrollController,
                          sparePartsCenterList: sparePartsCenterList,
                        ) : const Center(child: Text('Not Spare Parts Center')),

                        // MaintenanceFilter(
                        //   brandId: widget.brandId,
                        //   typeId: widget.typeId,
                        // ),
                        // MaintenanceCentersGrid(
                        //   controller: scrollController,
                        //   cubit: cubit,
                        //   maintenanceCenterList: maintenanceCenterList,
                        // ),

                        if (state is GetSparePartsCenterMoreLoading)
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(
                              color: AppColors.yellowColor2,
                            ),
                          ),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
