import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/products_guide/views/cubit/product_basket_cubit.dart';
import '../../../../core/helpers/navigation/navigation.dart';


class ProductTypeDropDown extends StatefulWidget {
  const ProductTypeDropDown({super.key, required this.hint});

  final String hint;

  @override
  State<ProductTypeDropDown> createState() => _ProductTypeDropDownState();
}

class _ProductTypeDropDownState extends State<ProductTypeDropDown> {
  late ScrollController _scrollController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initializeScrollController();
  }

  void _initializeScrollController() {
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.atEdge &&
        _scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _loadMoreData();
    }
  }

  Future<void> _loadMoreData() async {
    try {
      final cubit = context.read<ProductBasketCubit>();
      if (cubit.state is! ProductsTypeDropDawnLoadingMoreState && !_isLoading) {
        _setLoadingState(true);

        await cubit.fetchProductsTypeDropDown(
          page: cubit.productsPage + 1,
          more: true,
        );
        await Future.delayed(const Duration(milliseconds: 300));

        _setLoadingState(false);
      }
    } catch (e) {
      debugPrint('Error loading more data: $e');
      _setLoadingState(false);
    }
  }

  void _setLoadingState(bool isLoading) {
    if (mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            _isLoading = isLoading;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBasketCubit, ProductBasketState>(
      builder: (context, state) {
        final cubit = ProductBasketCubit.get(context);
        final productTypeList = cubit.productTypeDropDown ?? [];

        _updateSelectedServiceTypeName(cubit, productTypeList);

        return SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              _buildDropdownContainer(cubit, productTypeList, state),
            ],
          ),
        );
      },
    );
  }

  void _updateSelectedServiceTypeName(cubit, List productTypeList) {
    if (productTypeList.isNotEmpty && cubit.selectedProductTypeId != null) {
      cubit.selectedProductTypeName = productTypeList
          .firstWhere(
            (type) => type.id == cubit.selectedProductTypeId,
        orElse: () => null!,
      )
          .name;
    }
  }

  Widget _buildDropdownContainer(cubit, List productTypeList, state) {
    return Container(
      height: 35,
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Stack(
        children: [
          if (_isLoading || cubit.isLoadingProductType)
            const Center(child: CircularProgressIndicator(strokeWidth: 1.5))
          else
            _buildDropdownButton(cubit, productTypeList),
          if (state is ProductsTypeDropDawnLoadingMoreState)
            const Center(child: CircularProgressIndicator(strokeWidth: 1.5)),
        ],
      ),
    );
  }

  Widget _buildDropdownButton(cubit, List productTypeList) {
    return DropdownButton<String>(
      isExpanded: true,
      underline: const SizedBox.shrink(),
      value: cubit.selectedProductTypeId,
      hint: Text(
        cubit.selectedProductTypeName ?? widget.hint,
        style: const TextStyle(
          fontSize: 12,
          color: Color(0xffAAAAAA),
        ),
      ),
      items: [
        ..._buildDropdownItems(productTypeList),
        _buildLoadMoreItem(),
      ],
      onChanged: (val) {
        _onDropdownChanged(val, cubit);
      },
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownItems(List productTypeList) {
    return productTypeList.map((type) {
      return DropdownMenuItem<String>(
        value: type.id,
        child: Text(
          type.name.toString(),
          style: const TextStyle(fontSize: 10),
        ),
      );
    }).toList();
  }

  DropdownMenuItem<String> _buildLoadMoreItem() {
    return DropdownMenuItem<String>(
      value: 'load_more',
      child: Center(
        child: GestureDetector(
          onTap: () {
            AppNavigation.back();
            if (!_isLoading) {
              _loadMoreData();
            }
          },
          child: const Text(
            'Load More',
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  void _onDropdownChanged(String? val, cubit) {
    if (val == 'load_more') {
      _loadMoreData();
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            cubit.selectedProductTypeId = val;
          });
          debugPrint('${cubit.selectedProductTypeName} : ${cubit.selectedProductTypeId}');
        }
      });
    }
  }
}

