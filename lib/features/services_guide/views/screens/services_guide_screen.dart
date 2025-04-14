import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';
import 'package:roadapp/features/maintenance_service/views/widgets/maintenance_service_item.dart';
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
    var cubit = context.read<MaintenanceServiceTypeVendorCubit>();

    super.initState();
    cubit.fetchMaintenanceServiceType();
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
                            child:  Center(
                                child: Text(
                                  'حدث خطأ أثناء تحميل البيانات.',
                                )),
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

class ServiceItem extends StatelessWidget {
  final String id;
  final String name;
  final double cost;


  const ServiceItem({
    super.key,
    required this.id,
    required this.name, required this.cost,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _showOptionsDialog(context);
      },
      child: MaintenanceServiceItem(
        title: name,
      ),
    );
  }

  void _showOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(StringManager.select.tr(context)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _showEditDialog(context);
              },
              child: Text(StringManager.update.tr(context)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _confirmDelete(context);
              },
              child: Text(StringManager.delete.tr(context),
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(BuildContext context) {
    var cubit = context.read<MaintenanceServiceTypeVendorCubit>();

    cubit.nameTextEditingController.text = name;
    cubit.costTextEditingController.text = cost.toString();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(StringManager.update.tr(context)),
          content: SingleChildScrollView(
            child: Form(
              key: cubit.updateServiceKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: cubit.costTextEditingController,
                    decoration: InputDecoration(
                      labelText: StringManager.cost.tr(context),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'please enter number';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(StringManager.cancel.tr(context)),
            ),
            TextButton(
              onPressed: () {
                if(cubit.updateServiceKey.currentState!.validate()){
                  cubit.updateService(id);
                  Navigator.pop(context);
                }

              },
              child: Text(StringManager.save.tr(context)),
            ),
          ],
        );
      },
    );
  }

  void _confirmDelete(BuildContext context) {
    var cubit = context.read<MaintenanceServiceTypeVendorCubit>();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(StringManager.confirmDeletion.tr(context),),
          content: Text(StringManager.areYouDeleteProduct.tr(context),),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(StringManager.cancel.tr(context)),
            ),
            TextButton(
              onPressed: () {
                cubit.deleteService(id);
                // تنفيذ حذف المنتج هنا
                Navigator.pop(context);
              },
              child: Text(StringManager.delete.tr(context), style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
