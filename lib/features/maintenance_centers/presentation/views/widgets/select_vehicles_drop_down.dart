import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/features/vehicles/presentation/cubit/vehicles_state.dart';

import '../../../../maintenance_center_details/cubit/maintenance_center_details_cubit.dart';
import '../../../../maintenance_center_details/cubit/maintenance_center_details_states.dart';
import '../../../../vehicles/presentation/cubit/vehicles_cubit.dart';

class SelectVehiclesDropDown extends StatefulWidget {
  const SelectVehiclesDropDown(
      {super.key, required this.label, required this.hint});

  final String label, hint;

  @override
  _SelectVehiclesDropDownState createState() => _SelectVehiclesDropDownState();
}

class _SelectVehiclesDropDownState extends State<SelectVehiclesDropDown> {
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
    var cubit = context.read<VehiclesCubit>();
    cubit.fetchVehicles(page: cubit.vehiclesPage + 1, more: true);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaintenanceCenterDetailsCubit,
        MaintenanceCenterDetailsStates>(
      builder: (context, state) {
        var cubit = MaintenanceCenterDetailsCubit.get(context);

        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.label,
                style: const TextStyle(fontSize: 10),
              ),
              const Gap(4),
              Container(
                height: 31.2,
                decoration: BoxDecoration(
                  color: const Color(0xFFECECEC),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: BlocBuilder<VehiclesCubit, VehiclesState>(
                  builder: (context, state) {
                    var cubitVih = VehiclesCubit.get(context);

                    String? selectedVehiclesName;
                    if (cubitVih.vehicles != null && cubit.vehiclesId != null) {
                      selectedVehiclesName = cubitVih.vehicles
                          ?.firstWhere(
                            (brand) => brand.id == cubit.vehiclesId,
                            orElse: () => null!,
                          )
                          .brandId!
                          .name;
                    }

                    return DropdownButton<String>(
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      isExpanded: true,
                      underline: const SizedBox.shrink(),
                      hint: Text(
                        selectedVehiclesName ?? widget.hint,
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: const Color(0xffAAAAAA),
                        ),
                      ),
                      items: cubitVih.vehicles?.map((vehicle) {
                        return DropdownMenuItem<String>(
                          value: vehicle.id,
                          child:
                              Text("${vehicle.brandId!.name} - ${vehicle.model}"),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          cubit.vehiclesId = val;
                        });
                        debugPrint("Selected vehiclesId ====>>: ${cubit.vehiclesId}");
                        debugPrint(
                            "Selected vehiclesName ====>>: $selectedVehiclesName");
                      },
                    );
                  },
                ),
              ),
            ],
          );
      },
    );
  }
}
