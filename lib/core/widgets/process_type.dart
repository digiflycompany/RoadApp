import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_cubit.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_state.dart';

class ProcessType extends StatelessWidget {
  const ProcessType({
    super.key,
    required this.bonds,
  });

  final bool bonds;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        StringManager.processType.tr(context),
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      BlocBuilder<BusinessModelsCubit, BusinessModelsState>(
          builder: (context, state) {
        final cubit = BusinessModelsCubit.get(context);

        return RadioGroup<int>(
            groupValue: cubit.selectedRadio,
            onChanged: (value) {
              if (value != null) {
                cubit.changeRadio(value);
              }
            },
            child: Wrap(spacing: 4, children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Radio<int>(
                    value: 1,
                  ),
                  Text(
                    bonds
                        ? StringManager.receipt.tr(context)
                        : StringManager.examinationRequest.tr(context),
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
              if (bonds)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Radio<int>(
                      value: 2,
                    ),
                    Text(
                      StringManager.paymentVoucher.tr(context),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              if (bonds)
                Row(mainAxisSize: MainAxisSize.min, children: [
                  const Radio<int>(
                    value: 3,
                  ),
                  Text(StringManager.salesBill.tr(context),
                      style: const TextStyle(fontSize: 12))
                ])
            ]));
      })
    ]);
  }
}
