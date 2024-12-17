import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_state.dart';

import '../cubit/maintenance_service_type_cubit.dart';

class CarBrandDropDown extends StatefulWidget {
  const CarBrandDropDown({super.key, required this.hint});

  final String hint;

  @override
  State<CarBrandDropDown> createState() => _CarBrandDropDownState();
}

class _CarBrandDropDownState extends State<CarBrandDropDown> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.position.atEdge &&
        scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
      _loadMoreData();
    }
  }

  void _loadMoreData() {
    final cubit = context.read<MaintenanceServiceTypeVendorCubit>();
    if (cubit.state is! CarBrandDropDawnLoadingMoreState) {
      cubit.fetchCarBrand(page: cubit.carBrandPage + 1, more: true);
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaintenanceServiceTypeVendorCubit, MaintenanceServiceTypeVendorState>(
      builder: (context, state) {
        final cubit = MaintenanceServiceTypeVendorCubit.get(context);
        final nameClientList = cubit.carBrandList ?? [];
        final isLoadingMore = state is CarBrandDropDawnLoadingMoreState;

        if (nameClientList.isNotEmpty && cubit.selectedCarBrandId != null) {
          cubit.selectedCarBrandName = nameClientList
              .firstWhere(
                (product) => product.id == cubit.selectedCarBrandId,
                orElse: () => null!,
              )
              .name;
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Container(
                height: 35,
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9F9F9),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Stack(
                  children: [
                    DropdownButton<String>(
                      isExpanded: true,
                      underline: const SizedBox.shrink(),
                      hint: Text(
                        cubit.selectedCarBrandName ?? widget.hint,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xffAAAAAA),
                        ),
                      ),
                      items: nameClientList.map((product) {
                        return DropdownMenuItem<String>(
                          value: product.id,
                          child: Text(
                            product.name.toString(),
                            style: const TextStyle(fontSize: 10),
                          ),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          cubit.selectedCarBrandId = val;
                        });
                        debugPrint(
                            '${cubit.selectedCarBrandName} : ${cubit.selectedCarBrandId}');
                      },
                    ),
                    if (isLoadingMore)
                      const Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: SizedBox(
                            height: 15,
                            width: 15,
                            child: CircularProgressIndicator(strokeWidth: 1.5),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
