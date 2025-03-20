import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_state.dart';
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
  const NameClientRegularDropDown({super.key, required this.hint});

  final String hint;

  @override
  State<NameClientRegularDropDown> createState() => _NameClientRegularDropDownState();
}

class _NameClientRegularDropDownState extends State<NameClientRegularDropDown> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    BusinessModelsCubit.get(context).fetchCustomerReports();
  }

  void _scrollListener() {
    if (scrollController.position.atEdge &&
        scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
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
        final nameClientList = cubit.customerReportList ?? [];

        if (nameClientList.isNotEmpty && cubit.selectClientIdRegularCustomer != null) {
          cubit.selectClientNameRegularCustomer = nameClientList
              .firstWhere(
                (data) => data.id == cubit.selectClientIdRegularCustomer,
            orElse: () => null!,
          )
              .fullName;
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
                      items: nameClientList.map((data) {
                        return DropdownMenuItem<String>(
                          value: data.id,
                          child: Text(
                            data.fullName.toString(),
                            style: const TextStyle(fontSize: 10),
                          ),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          cubit.selectClientIdRegularCustomer = val;
                        });
                        debugPrint(
                            '${cubit.selectClientNameRegularCustomer} : ${cubit.selectClientIdRegularCustomer}');
                      },),

                  ]
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
