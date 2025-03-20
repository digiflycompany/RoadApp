import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/products_guide/views/widgets/products_guide_grid.dart';

import '../../../../core/widgets/custom_loading_indicator.dart';
import '../../../maintenance_service/views/widgets/maintenance_service_item.dart';
import '../cubit/product_basket_cubit.dart';
import '../widgets/search_product_row.dart';

class ProductsGuideScreen extends StatefulWidget {
  const ProductsGuideScreen({super.key});

  @override
  State<ProductsGuideScreen> createState() => _ProductsGuideScreenState();
}

class _ProductsGuideScreenState extends State<ProductsGuideScreen> {
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
    var cubit = context.read<ProductBasketCubit>();
    if (cubit.state is! ProductsTypeLoadingMoreState) {
      cubit.fetchProductType(page: cubit.productsPage + 1, more: true);
    }
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
          child: CustomAppBar(text: StringManager.productsGuide.tr(context))),
      body: BlocBuilder<ProductBasketCubit, ProductBasketState>(
        builder: (context, state) {
          var cubit = ProductBasketCubit.get(context);

          return Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              children: [
                SearchProductRow(
                  onChanged: (val) {
                    cubit.searchProductType(searchField: val);
                  },
                ),

                // SizedBox(height: 30.h),
                // const Expanded(child: ProductsGuideGrid())

                SizedBox(height: 30.h),
                state is ProductsTypeLoadingState ||
                        state is SearchProductsTypeLoadingState
                    ? const Expanded(
                        child: Center(
                          child: CustomLoadingIndicator(),
                        ),
                      )
                    : state is ProductsTypeErrorState ||
                            state is SearchProductsTypeErrorState
                        ? const Expanded(
                            child: Center(
                                child: Text(
                              'حدث خطأ أثناء تحميل البيانات.',
                            )),
                          )
                        : cubit.productType == null
                            ? const Expanded(
                                child: Center(
                                  child: Text('Empty'),
                                ),
                              )
                            : ProductsGuideGrid(
                                controller: scrollController,
                                cubit: cubit,
                              ),
                SizedBox(
                  height: 10.h,
                ),
                state is ProductsTypeLoadingMoreState
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


class ProductItem extends StatelessWidget {
  final String id;
  final String name;
  final double originalPrice;
  final double finalPrice;
  final int availableQuantity;

  const ProductItem({
    super.key,
    required this.id,
    required this.name,
    required this.originalPrice,
    required this.finalPrice,
    required this.availableQuantity,
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
    var cubit = context.read<ProductBasketCubit>();

    cubit.nameTextEditingController.text = name;
    cubit.originalPriceTextEditingController.text = originalPrice.toString();
    cubit.finalPriceTextEditingController.text = finalPrice.toString();
    cubit.availableQuantityTextEditingController.text = availableQuantity.toString();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(StringManager.update.tr(context)),
          content: SingleChildScrollView(
            child: Form(
              key: cubit.updateProductKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: cubit.originalPriceTextEditingController,
                    decoration: InputDecoration(
                        labelText: StringManager.originalPrice.tr(context),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'please enter number';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: cubit.finalPriceTextEditingController,
                    decoration: InputDecoration(
                        labelText: StringManager.finalPrice.tr(context),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'please enter number';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: cubit.availableQuantityTextEditingController,
                    decoration: InputDecoration(
                        labelText: StringManager.availableQuantity.tr(context),
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
                if(cubit.updateProductKey.currentState!.validate()){
                  cubit.updateProduct(id);
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
    var cubit = context.read<ProductBasketCubit>();

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
                cubit.deleteProduct(id);
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