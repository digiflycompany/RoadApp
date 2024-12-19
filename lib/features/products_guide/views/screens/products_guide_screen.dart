import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/products_guide/views/widgets/products_guide_grid.dart';
import 'package:roadapp/features/services_guide/views/widgets/search_row.dart';

import '../../../../core/widgets/custom_loading_indicator.dart';
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
