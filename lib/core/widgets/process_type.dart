import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_cubit.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_state.dart';

class ProcessType extends StatelessWidget {
  const ProcessType({super.key, required this.bonds});

  final bool bonds;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(StringManager.processType.tr(context),
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        BlocBuilder<BusinessModelsCubit, BusinessModelsState>(
          builder: (context, state) {
            var cubit = BusinessModelsCubit.get(context);
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
                        bonds
                            ? StringManager.receipt.tr(context)
                            : StringManager.examinationRequest.tr(context),
                        style: const TextStyle(fontSize: 12))
                  ],
                ),
                bonds
                    ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio(
                        value: 2,
                        groupValue: cubit.selectedRadio,
                        onChanged: (value) => cubit.changeRadio(value ?? 2)),
                    Text(
                         StringManager.paymentVoucher.tr(context),
                        style: const TextStyle(fontSize: 12))
                  ],
                ) :const SizedBox(),
                bonds
                    ?Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio(
                        value: 3,
                        groupValue: cubit.selectedRadio,
                        onChanged: (value) => cubit.changeRadio(value ?? 3)),
                    Text(
                        StringManager.salesBill.tr(context),
                        style: const TextStyle(fontSize: 12))
                  ],
                ) : const SizedBox()
              ],
            );
          },
        )
      ],
    );
  }
}
