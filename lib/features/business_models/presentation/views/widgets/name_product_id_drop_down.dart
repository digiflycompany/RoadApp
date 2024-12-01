import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_state.dart';
import '../../manager/business_models_cubit.dart';


class NameProductIdDropDown extends StatefulWidget {
  const NameProductIdDropDown({super.key, required this.label, required this.hint});

  final String label, hint;

  @override
  State<NameProductIdDropDown> createState() => _NameProductIdDropDownState();
}

class _NameProductIdDropDownState extends State<NameProductIdDropDown> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.position.atEdge &&
        scrollController.position.pixels == scrollController.position.maxScrollExtent) {
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
        final nameProductList = cubit.productList ?? [];
        final isLoadingMore = state is GetProductMoreLoading;

        if (nameProductList.isNotEmpty && cubit.selectedProductId != null) {
          cubit.selectedNameProduct = nameProductList
              .firstWhere(
                (product) => product.id == cubit.selectedProductId ,
            orElse: () => null!,
          )
              ?.name;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label,
              style: const TextStyle(fontSize: 10),
            ),
            const SizedBox(height: 4),
            Container(
              height: 35,
              decoration: BoxDecoration(
                color: const Color(0xFFECECEC),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Stack(
                children: [
                  DropdownButton<String>(
                    isExpanded: true,
                    underline: const SizedBox.shrink(),
                    hint: Text(
                      cubit.selectedNameProduct ?? widget.hint,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xffAAAAAA),
                      ),
                    ),
                    items: nameProductList.map((product) {
                      return DropdownMenuItem<String>(
                        value: product.id,
                        child: Text(product.name.toString()),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {

                        cubit.selectedProductId = val;
                      });
                      debugPrint('${cubit.selectedNameProduct} : ${cubit.selectedProductId}');
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
        );
      },
    );
  }
}