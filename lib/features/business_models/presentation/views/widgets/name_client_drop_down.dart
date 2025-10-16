import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_state.dart';
import 'package:roadapp/features/clients/data/models/customer_reports_response_model.dart';
import '../../../../../core/Theming/styles.dart';
import '../../../../../core/helpers/string_manager.dart';
import '../../manager/business_models_cubit.dart';

class NameClientDropDown extends StatefulWidget {
  const NameClientDropDown({super.key, required this.hint});

  final String hint;

  @override
  State<NameClientDropDown> createState() => _NameClientDropDownState();
}

class _NameClientDropDownState extends State<NameClientDropDown> {
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
    final cubit = context.read<BusinessModelsCubit>();
    if (cubit.state is! GetProductMoreLoading) {
      cubit.fetchProducts(page: cubit.productPage + 1, more: true);
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessModelsCubit, BusinessModelsState>(
      builder: (context, state) {
        final cubit = BusinessModelsCubit.get(context);
        final nameClientList = cubit.maintenanceCenterList ?? [];
        final isLoadingMore = state is GetMaintenanceCentersMoreLoading;

        if (nameClientList.isNotEmpty && cubit.selectedClientId != null) {
          cubit.selectedNameClient = nameClientList
              .firstWhere(
                (product) => product.id == cubit.selectedClientId,
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
                        cubit.selectedNameClient ?? widget.hint,
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
                          cubit.selectedClientId = val;
                        });
                        debugPrint(
                            '${cubit.selectedNameClient} : ${cubit.selectedClientId}');
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

class NameClientRegularDropDown extends StatefulWidget {
  const NameClientRegularDropDown({
    super.key,
    required this.hint,
    required this.licensePlateNumber,
  });

  final String hint;
  final bool licensePlateNumber;

  @override
  State<NameClientRegularDropDown> createState() =>
      _NameClientRegularDropDownState();
}

class _NameClientRegularDropDownState extends State<NameClientRegularDropDown> {
  late ScrollController scrollController;
  bool _fetched = false; // prevent double fetch

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Call APIs only once when widget becomes ready
    if (!_fetched) {
      final cubit = BusinessModelsCubit.get(context);
      debugPrint("📡 Fetching customers and maintenance centers...");
      cubit.fetchCustomerReports();
      cubit.fetchMaintenanceCenter();
      _fetched = true;
    }
  }

  void _scrollListener() {
    if (scrollController.position.atEdge &&
        scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
      // Pagination logic if needed
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessModelsCubit, BusinessModelsState>(
      builder: (context, state) {
        final cubit = BusinessModelsCubit.get(context);

        // Get both lists
        final customers = cubit.customerReportList ?? [];
        final vendors = cubit.maintenanceCenterList ?? [];

        debugPrint(
            "👤 Customers: ${customers.length}, 🧰 Vendors: ${vendors.length}");

        // Combine both
        final List<Map<String, dynamic>> combinedList = [
          ...customers.map((c) => {
            'id': c.id ?? '',
            'name': c.fullName ?? '',
            'type': 'customer',
            'vehicles': c.vehicles ?? [],
          }),
          ...vendors.map((v) => {
            'id': v.id ?? '',
            'name': '${StringManager.maintenanceCenters.tr(context)} - ${v.name ?? ''}',
            'type': 'vendor',
            'vehicles': [],
          }),
        ];

        if (combinedList.isNotEmpty &&
            cubit.selectClientIdRegularCustomer != null) {
          final selectedClient = combinedList.firstWhere(
                (data) => data['id'] == cubit.selectClientIdRegularCustomer,
            orElse: () => combinedList.first,
          );
          cubit.selectClientNameRegularCustomer =
          selectedClient['name'] as String?;
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Container(
                height: 48,
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9F9F9),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Stack(
                  children: [
                    combinedList.isEmpty
                        ? Text(
                      StringManager.noClientAvailable.tr(context),
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xffAAAAAA),
                      ),
                    )
                        : widget.licensePlateNumber
                    // ---------------- VEHICLE DROPDOWN ----------------
                        ? DropdownButton<String>(
                      isExpanded: true,
                      underline: const SizedBox.shrink(),
                      value: cubit.selectedVehicleNumbers,
                      hint: Text(
                        widget.hint,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xffAAAAAA),
                        ),
                      ),
                      items: (() {
                        ClientData? selectedCustomer;
                        if (customers.isNotEmpty) {
                          final matching = customers.where((data) =>
                          data.id ==
                              cubit.selectClientIdRegularCustomer);
                          if (matching.isNotEmpty) {
                            selectedCustomer = matching.first;
                          } else {
                            selectedCustomer = customers.first;
                          }
                        }

                        if (selectedCustomer != null &&
                            selectedCustomer.vehicles != null &&
                            selectedCustomer.vehicles!.isNotEmpty) {
                          return selectedCustomer.vehicles!.map((v) {
                            return DropdownMenuItem<String>(
                              value: v.plateNumber,
                              child: Text(
                                v.plateNumber ?? '',
                                style:
                                const TextStyle(fontSize: 10),
                              ),
                            );
                          }).toList();
                        }
                        return <DropdownMenuItem<String>>[];
                      })(),
                      onChanged: (val) {
                        final selected = combinedList.firstWhere((e) => e['id'] == val);

                        cubit.changeSelectedChild(val!);
                        cubit.selectedVehicleNumbers = null;
                        cubit.selectedNameClient = selected['name'] as String?;
                        cubit.selectedClientId = selected['id']?.toString();

                        debugPrint("🎯 onChanged: selected['id'] = ${selected['id']}");
                        debugPrint("🎯 cubit.selectedClientId = ${cubit.selectedClientId}");
                        setState(() {});
                      },



                    )
                    // ---------------- CLIENT/VENDOR DROPDOWN ----------------
                        : DropdownButton<String>(
                      isExpanded: true,
                      underline: const SizedBox.shrink(),
                      value: cubit.selectClientIdRegularCustomer,
                      hint: Text(
                        widget.hint,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xffAAAAAA),
                        ),
                      ),
                      items: combinedList.map((entry) {
                        return DropdownMenuItem<String>(
                          value: entry['id'] as String,
                          child: Text(
                            entry['name'] as String,
                            style: const TextStyle(fontSize: 10),
                          ),
                        );
                      }).toList(),
                      onChanged: (val) {
                        final selected = combinedList.firstWhere((e) => e['id'] == val);

                        cubit.changeSelectedChild(val!);
                        cubit.selectedVehicleNumbers = null;
                        cubit.selectedNameClient = selected['name'] as String?;
                        cubit.selectedClientId = selected['id']?.toString();

                        debugPrint("🎯 onChanged: selected['id'] = ${selected['id']}");
                        debugPrint("🎯 cubit.selectedClientId = ${cubit.selectedClientId}");
                        setState(() {});
                      },
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
