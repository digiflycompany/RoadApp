import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/helpers/functions/show_default_dialog.dart';
import 'package:roadapp/core/helpers/functions/toast.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/functions/general_functions.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/core/widgets/custom_text_field.dart';
import 'package:roadapp/features/products_guide/views/widgets/product_type_drop_down.dart';
import 'package:roadapp/features/products_guide/views/widgets/select_product_process_type.dart';
import 'package:roadapp/features/services_guide/views/widgets/car_brand_drop_down.dart';
import 'package:roadapp/features/services_guide/views/widgets/select_service_process_type.dart';
import 'package:roadapp/features/services_guide/views/widgets/service_type_drop_down.dart';

import '../../../../core/Theming/styles.dart';
import '../cubit/product_basket_cubit.dart';

class SearchProductRow extends StatelessWidget {
  const SearchProductRow({super.key, this.onChanged});

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
              height: 43,
              decoration: BoxDecoration(
                  color: AppColors.greyColor2.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(10.r)),
              child: TextField(
                  style: Styles.textStyle12,
                  //onChanged: onChanged,
                  onSubmitted: onChanged,
                  onTapOutside: (v) => GeneralFunctions.hideKeyboard(),
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      hintText: StringManager.search.tr(context),
                      hintStyle: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xFFAAAAAA).withOpacity(0.5)),
                      border: InputBorder.none,
                      prefixIcon: const Icon(CupertinoIcons.search,
                          color: Colors.grey, size: 17.5)))),
        ),

        SizedBox(
          width: 10.w,
        ),

        BlocBuilder<ProductBasketCubit,
            ProductBasketState>(
          builder: (context, state) {
            var cubit = ProductBasketCubit.get(context);
            return GestureDetector(
              onTap: () {
                //cubitVendor.fetchCarBrand();
                cubit.fetchProductsTypeDropDown();
                buildShowCustomAlertDialog(context,cubit);
              },
              child: Container(
                height: 40.h,
                width: 35.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.primaryColor),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
                  child: SvgPicture.asset(
                    AppAssets.addIcon,
                  ),
                ),
              ),
            );
          },
        ),

      ],
    );
  }

  void buildShowCustomAlertDialog(BuildContext context,ProductBasketCubit cubit ) {
    return showCustomAlertDialog(
      onComplete: (){
        cubit.originalPriceTextEditingController.clear();
        cubit.nameTextEditingController.clear();
        cubit.finalPriceTextEditingController.clear();
        cubit.availableQuantityTextEditingController.clear();
        cubit.selectedProductTypeId= null;
      },
      context: context,
      title: StringManager.addProduct.tr(context),
      content: BlocConsumer<ProductBasketCubit,
          ProductBasketState>(
        listener: (context, state) {
          var cubit = ProductBasketCubit.get(context);
          if (state is AddProductsErrorState) {
            AppNavigation.back();
            cubit.originalPriceTextEditingController.clear();
            cubit.nameTextEditingController.clear();
            cubit.finalPriceTextEditingController.clear();
            cubit.availableQuantityTextEditingController.clear();
            cubit.selectedProductTypeId= null;

             showDefaultDialog(
              context,
              title: 'Error',
              type: NotificationType.error,
              description: state.error,
            );
          }
          else if (state is AddProductsSuccessState) {
            AppNavigation.back();
            cubit.originalPriceTextEditingController.clear();
            cubit.nameTextEditingController.clear();
            cubit.finalPriceTextEditingController.clear();
            cubit.availableQuantityTextEditingController.clear();
            cubit.selectedProductTypeId= null;
          showToast(message: 'Success', state: ToastStates.success);
          }else if (state is AddProductSuggestionSuccessState) {
            AppNavigation.back();
            cubit.originalPriceTextEditingController.clear();
            cubit.nameTextEditingController.clear();
            cubit.finalPriceTextEditingController.clear();
            cubit.availableQuantityTextEditingController.clear();
            cubit.selectedProductTypeId= null;            showToast(message: 'Success', state: ToastStates.success);
          }else if (state is AddProductSuggestionErrorState) {
            AppNavigation.back();
            cubit.originalPriceTextEditingController.clear();
            cubit.nameTextEditingController.clear();
            cubit.finalPriceTextEditingController.clear();
            cubit.availableQuantityTextEditingController.clear();
            cubit.selectedProductTypeId= null;
            showDefaultDialog(
              context,
              title: 'Error',
              type: NotificationType.error,
              description: state.error,
            );
          }
        },
        builder: (context, state) {
          var cubit = ProductBasketCubit.get(context);
          return SingleChildScrollView(
            child: Column(
              children: [
                const SelectProductProcessType(),
                SizedBox(height: 10.h),
                cubit.selectedRadio == 1
                    ? AddProductsWidget(cubit: cubit,state: state,)
                    : ProductRequestWidget(cubit: cubit,state: state,),
              ],
            ),
          );
        },
      ),
    );
  }
}


class ProductRequestWidget extends StatelessWidget {
  const ProductRequestWidget({
    super.key,
    required this.cubit,
    required this.state,
  });

  final ProductBasketCubit cubit;
  final ProductBasketState state;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Text(
            StringManager.pleaseEnterServiceTitle.tr(context),
            style: TextStyle(fontSize: 12.sp),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.r)),
            padding: EdgeInsets.all(10.w),
            child: TextField(
              controller: cubit.nameTextEditingController,
              maxLines: 3,
              decoration: InputDecoration.collapsed(
                hintText: StringManager.yourMessage.tr(context),
                hintStyle: TextStyle(
                  fontSize: 12.sp,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          state is AddProductSuggestionLoadingState
              ? const Center(child: CircularProgressIndicator())
              : Center(
                  child: CustomElevatedButton(
                      onTap: () {
                        if (cubit.nameTextEditingController.text.isEmpty) {
                          showToast(
                              message:
                                  'Please Select Name',
                              state: ToastStates.error);
                        } else {
                          cubit.productSuggestion();
                        }
                        //AppNavigation.back();
                      },
                      widget: Text(
                          StringManager.add.tr(context),
                          style: TextStyle(fontSize: 10.sp))),
                )
        ],
      );
  }
}

class AddProductsWidget extends StatelessWidget {
  const AddProductsWidget({
    super.key,
    required this.cubit,
    required this.state,
  });

  final ProductBasketCubit cubit;
  final ProductBasketState state;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Form(
            key: cubit.addProductKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(StringManager.name.tr(context),
                    style: TextStyle(fontSize: 12.sp),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 5.h,
                ),
                CustomTextField(
                  height: 70.h,
                  fillColor: const Color(0xFFF9F9F9),
                  borderColor: Colors.transparent,
                  hintText: StringManager.name.tr(context),
                  controller: cubit.nameTextEditingController,
                  validationFunc: (val){
                    if(cubit.nameTextEditingController.text.isEmpty){
                      return 'Enter your name';
                    }
                    return null;
                  },
                ),

                Text(StringManager.productType.tr(context),
                    style: TextStyle(fontSize: 12.sp),
                    textAlign: TextAlign.center),
                // SizedBox(
                //   height: 10.h,
                // ),
                ProductTypeDropDown(hint: StringManager.productType.tr(context),),

                SizedBox(
                  height: 15.h,
                ),
                Text(StringManager.availableQuantity.tr(context),
                    style: TextStyle(fontSize: 12.sp),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 5.h,
                ),
                CustomTextField(
                  height: 70.h,
                  fillColor: const Color(0xFFF9F9F9),
                  borderColor: Colors.transparent,
                  textInputType: TextInputType.number,
                  hintText: StringManager.availableQuantity.tr(context),
                  controller: cubit.availableQuantityTextEditingController,
                  validationFunc: (val){
                    if(cubit.availableQuantityTextEditingController.text.isEmpty){
                      return 'Enter Available Quantity';
                    }
                    return null;
                  },
                ),
                // ServiceTypeDropDown(
                //   hint: StringManager.serviceType.tr(context),
                // ),
               // SizedBox(height: 10.h),

                Text(StringManager.originalPrice.tr(context),
                    style: TextStyle(fontSize: 12.sp),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextField(
                  height: 70.h,
                  fillColor: const Color(0xFFF9F9F9),
                  borderColor: Colors.transparent,
                  hintText: StringManager.originalPrice.tr(context),
                  textInputType: TextInputType.number,
                  controller: cubit.originalPriceTextEditingController,
                  validationFunc: (val){
                    if(cubit.originalPriceTextEditingController.text.isEmpty){
                      return 'Enter Original Price';
                    }
                    return null;
                  },
                ),

                //SizedBox(height: 10.h),

                Text(StringManager.finalPrice.tr(context),
                    style: TextStyle(fontSize: 12.sp),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextField(
                  height: 70.h,
                  fillColor: const Color(0xFFF9F9F9),
                  borderColor: Colors.transparent,
                  hintText: StringManager.finalPrice.tr(context),
                  textInputType: TextInputType.number,
                  controller: cubit.finalPriceTextEditingController,
                  validationFunc: (val){
                    if(cubit.finalPriceTextEditingController.text.isEmpty){
                      return 'Enter Final Price';
                    }
                    return null;
                  },
                ),

              ],
            ),
          ),

          SizedBox(height: 10.h),

          // Text(StringManager.currency.tr(context),
          //     style: TextStyle(fontSize: 12.sp),
          //     textAlign: TextAlign.center),
          // SizedBox(
          //   height: 10.h,
          // ),
          // CustomTextField(
          //   height: 40.h,
          //   fillColor: const Color(0xFFF9F9F9),
          //   borderColor: Colors.transparent,
          //   hintText: StringManager.currency.tr(context),
          //   textInputType: TextInputType.number,
          //   controller: cubit.currencyTextEditingController,
          // ),



          SizedBox(
            height: 10.h,
          ),
          state is AddProductsLoadingState
              ? const Center(child: CircularProgressIndicator())
              : Center(
                  child: CustomElevatedButton(
                      onTap: () {
                        if (cubit.selectedProductTypeName ==
                            null) {
                          showToast(
                              message:
                                  'Please Select Product Type',
                              state: ToastStates.error);
                        }else {

                          if(cubit.addProductKey.currentState!.validate()){
                            cubit.createProduct();

                          }
                        }
                        //AppNavigation.back();
                      },
                      widget: Text(
                          StringManager.add.tr(context),
                          style: TextStyle(fontSize: 10.sp))),
                )
        ],
      );
  }
}
