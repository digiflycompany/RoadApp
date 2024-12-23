import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/products_guide/views/cubit/product_basket_cubit.dart';
import 'package:roadapp/features/work_reports/presentation/cubit/work_reports_cubit.dart';


class SelectProductProcessType extends StatelessWidget {
  const SelectProductProcessType({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(StringManager.processType.tr(context),
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        BlocBuilder<ProductBasketCubit, ProductBasketState>(
          builder: (context, state) {
            var cubit = ProductBasketCubit.get(context);
            return Wrap(
              spacing: 4,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio(
                        value: 1,
                        groupValue: cubit.selectedRadio,
                        onChanged: (value) => cubit.changeRadio(value ?? 1)),
                    Text(
                        StringManager.addProduct.tr(context),
                        style: const TextStyle(fontSize: 12))
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio(
                        value: 2,
                        groupValue: cubit.selectedRadio,
                        onChanged: (value) => cubit.changeRadio(value ?? 2)),
                    Text(
                        StringManager.productRequest.tr(context),
                        style: const TextStyle(fontSize: 12))
                  ],
                )
              ],
            );
          },
        )
      ],
    );
  }
}
