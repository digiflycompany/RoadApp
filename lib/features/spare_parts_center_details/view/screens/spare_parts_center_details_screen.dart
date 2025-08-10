import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/accessories_center_details/presentation/view/widgets/accessories_center_details_chart.dart';
import 'package:roadapp/features/accessories_center_details/presentation/view/widgets/accessories_image.dart';
import 'package:roadapp/features/layout/presentation/views/screens/app_layout.dart';
import 'package:roadapp/features/spare_parts_center_details/data/repo/spare_parts_center_details_repo.dart';
import 'package:roadapp/features/spare_parts_center_details/view/widgets/reserve_product_spare_parts.dart';
import 'package:roadapp/features/spare_parts_center_details/view/widgets/spare_part_price.dart';
import '../../../../core/dependency_injection/di.dart';
import '../../../../core/helpers/functions/toast.dart';
import '../../../../core/helpers/navigation/navigation.dart';
import '../../../spare_parts/cubit/spare_parts_type_cubit.dart';
import '../../../spare_parts_centers/presentation/manager/spare_parts_cubit.dart';
import '../../../spare_parts_centers/presentation/views/screens/spare_parts_centers_screen.dart';
import '../../cubit/spare_parts_center_details_cubit.dart';
import '../../cubit/spare_parts_center_details_states.dart';

class SparePartsCenterDetailsScreen extends StatelessWidget {
  const SparePartsCenterDetailsScreen(
      {super.key, this.sparePartsCenterList, required this.carBrandId});

  final dynamic sparePartsCenterList;
  final String carBrandId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SparePartsCenterDetailsCubit(
          context, getIt.get<SparePartsCenterDetailsRepo>()),
      child: BlocConsumer<SparePartsCenterDetailsCubit,
          SparePartsCenterDetailsStates>(
        listener: (BuildContext context, SparePartsCenterDetailsStates state) {
          if (state is BookingSparePartsSuccessState) {
            showToast(message: 'Send Success', state: ToastStates.success);
          }
          if (state is BookingSparePartsErrorState) {
            showToast(message: 'Error', state: ToastStates.error);
          }
        },
        builder: (BuildContext context, SparePartsCenterDetailsStates state) {
          final cubitwo = SparePartsTypeCubit.get(context);
          if (cubitwo.selectedProductType == null) {
            cubitwo.getProductType();
          }
          final cubit = SparePartsCenterDetailsCubit.get(context);
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: preferredSize,
              child: CustomAppBar(
                text: StringManager.spareParts.tr(context),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AccessoriesImage(
                      image: sparePartsCenterList.maintenanceCenterId.image,
                      nameCenter: sparePartsCenterList.maintenanceCenterId.name,
                      location:
                          "${sparePartsCenterList.maintenanceCenterId.address.city} - ${sparePartsCenterList.maintenanceCenterId.address.firstLine}",
                    ),
                    SparePartPrice(
                      price: sparePartsCenterList.price.finalPrice.toString(),
                      phoneNumber:
                          sparePartsCenterList.maintenanceCenterId.landline,
                    ),
                    //  const CustomSearchRow(),
                    SizedBox(height: 25.h),

                    Text(
                      StringManager.productType.tr(context),
                    ),
                    BlocBuilder<SparePartsTypeCubit, SparePartsTypeState>(
                      builder: (context, state) {
                        final cubit = SparePartsTypeCubit.get(context);

                        return DropdownButton<String>(
                          isExpanded: true,
                          value: cubit.selectedProductType,
                          hint: Text(StringManager.productType.tr(context)),
                          items: cubit.productTypeResponse?.data!.productTypes!
                              .map((service) {
                            debugPrint('product type id ===> ${service.id}');
                            debugPrint('brand  id ===> $carBrandId');
                            return DropdownMenuItem<String>(
                              value: service.id.toString(),
                              child: Text(service!
                                  .name!), // تأكد أن لديك `name` في موديل الخدمة
                            );
                          }).toList(),
                          onChanged: (value) {
                            cubit.selectedProductType = value;
                            SparePartsCubit.get(context).getSparePartsCenter(
                              typeId: value!,
                            );
                            // AppNavigation.navigate(
                            //     SparePartsCenters(
                            //       carBrandId: carBrandId,
                            //       typeId: value!,
                            //     ));

                            cubit.emit(
                                GetProductTypeSuccess()); // لتحديث الواجهة
                          },
                        );
                      },
                    ),

                    SizedBox(height: 25.h),

                    AccessoriesCenterDetailsChart(
                      allRav: sparePartsCenterList
                              .maintenanceCenterId.reviewsCount *
                          5,
                      employeesBehavior: sparePartsCenterList
                              .maintenanceCenterId
                              .averageReviews
                              .employeesBehavior *
                          5,
                      speed: sparePartsCenterList
                              .maintenanceCenterId.averageReviews.speed *
                          5,
                      honesty: sparePartsCenterList
                              .maintenanceCenterId.averageReviews.honesty *
                          5,
                      fairCost: sparePartsCenterList
                              .maintenanceCenterId.averageReviews.fairCost *
                          5,
                      efficiency: sparePartsCenterList
                              .maintenanceCenterId.averageReviews.efficiency *
                          5,
                    ),

                    Gap(10.h),

                    state is BookingSparePartsLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : ReserveProductSpareParts(
                            onTap: () {
                              if (cubit.commentController.text.isEmpty ||
                                  cubit.vehiclesId!.isEmpty) {
                                showToast(
                                    message: 'Enter Your Data',
                                    state: ToastStates.error);
                              } else {
                                cubit
                                    .createSparePartsBooking(
                                  productId: sparePartsCenterList.id,
                                  providerId: sparePartsCenterList
                                      .maintenanceCenterId.id,
                                  quantity: 1,
                                )
                                    .then((_) {
                                  SparePartsTypeCubit.get(context)
                                      .selectedProductType = null;
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AppLayout()));
                                });
                              }
                            },
                          )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
