import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/functions/show_default_loading_indicator.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/functions/toast.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/account/presentation/manager/account_cubit.dart';
import 'package:roadapp/features/account/presentation/manager/account_state.dart';
import 'package:roadapp/features/account/presentation/views/widgets/account_loading_shimmer.dart';
import 'package:roadapp/features/account/presentation/views/widgets/save_button.dart';
import 'package:roadapp/features/account/presentation/views/widgets/vendor_data_form.dart';
import 'package:roadapp/features/account/presentation/views/widgets/vendor_upload_profile_image.dart';

import '../../../../maintenance_service/views/widgets/maintenance_service_item.dart';
import '../../../../products_guide/views/screens/products_guide_screen.dart';
import '../../../../services_guide/views/screens/services_guide_screen.dart';

class MyMaintenanceCenters extends StatelessWidget {
  const MyMaintenanceCenters({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        AccountCubit.get(context).image = null;
        AccountCubit.get(context).imageUrl = null;
      },
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, 76.h),
            child: CustomAppBar(text: StringManager.profile.tr(context))),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: BlocConsumer<AccountCubit, AccountState>(
            listener: (context, state) {
              var cubit = AccountCubit.get(context);
              if (state is UpdateProfileSuccessState) {
                Navigator.pop(context);
                showToast(
                    message:
                        StringManager.profileUpdatedSuccessfully.tr(context),
                    state: ToastStates.success);
              }

              if (state is UpdateMcLoadingState) {
                showDefaultLoadingIndicator(context);
              }
              if (state is UpdateMcSuccessState) {
                Navigator.pop(context);
                Navigator.pop(context);

                showToast(
                    message:
                        StringManager.profileUpdatedSuccessfully.tr(context),
                    state: ToastStates.success);
              }
            },
            builder: (context, state) {
              var cubit = AccountCubit.get(context);
              return state is AccountLoadingState || cubit.userData== null
                  ? const AccountLoadingShimmer()
                  : state is AccountErrorState
                      ? Center(child: Text(state.errorMessage))
                      : SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 40.h),
                              const VendorUploadImageProfile(),
                              VendorDataForm(user: cubit.userData!.user!),

                              /// **إضافة قائمة الخدمات أفقياً**
                              SizedBox(height: 20.h),
                              Text(
                                StringManager.availableServices.tr(context),
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              state is ServicesTypeLoadingState || state is ProductsTypeLoadingState
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : cubit.serviceType == null ||
                                          cubit.serviceType!.isEmpty
                                      ? const Center(
                                          child: Text("لا توجد خدمات متاحة"))
                                      : SizedBox(
                                          height: 150.h,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                cubit.serviceType!.length,
                                            itemBuilder: (context, index) {
                                              final service =
                                                  cubit.serviceType![index];
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: GestureDetector(
                                                  onTap: (){
                                                  //  cubit.fetchMaintenanceServiceType();
                                                    AppNavigation.navigate(const ServicesGuideScreen());
                                                  },
                                                  child: MaintenanceServiceItem(
                                                    title: service.name!,
                                                    price:
                                                        service.cost.toString(),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),


                              SizedBox(height: 20.h),
                              Text(
                                StringManager.availableProducts.tr(context),
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              state is ServicesTypeLoadingState || state is ProductsTypeLoadingState
                                  ? const Center(
                                  child: CircularProgressIndicator())
                                  : cubit.productType == null ||
                                  cubit.productType!.isEmpty
                                  ? const Center(
                                  child: Text("لا توجد منتجات متاحة"))
                                  : SizedBox(
                                height: 150.h,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                  cubit.productType!.length,
                                  itemBuilder: (context, index) {
                                    final products =
                                    cubit.productType![index];
                                    return Padding(
                                      padding:
                                      const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: (){
                                         // cubit.fetchProductType();
                                          AppNavigation.navigate(const ProductsGuideScreen());
                                        },
                                        child: MaintenanceServiceItem(
                                          title: products.name!,
                                          price:
                                          products.price!.finalPrice!.toString(),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              SizedBox(height: 20.h),

                              /// **زر الحفظ**
                              const Center(child: SaveButton()),
                              SizedBox(height: 40.h),
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
