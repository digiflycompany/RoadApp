import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_cubit.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_state.dart';
import 'package:roadapp/features/business_models/presentation/views/widgets/add_product.dart';
import 'package:roadapp/features/business_models/presentation/views/widgets/add_product_button.dart';
import 'package:roadapp/features/business_models/presentation/views/widgets/notes.dart';
import 'package:roadapp/features/business_models/presentation/views/widgets/process_data_fields.dart';
import 'package:roadapp/core/widgets/process_type.dart';
import 'package:roadapp/features/business_models/presentation/views/widgets/product_bill.dart';
import 'package:roadapp/features/business_models/presentation/views/widgets/review_data.dart';

class DebenturesBusinessModelsScreen extends StatelessWidget {
  const DebenturesBusinessModelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        BusinessModelsCubit.get(context).productsAdd.clear();
        BusinessModelsCubit.get(context).dataRow.clear();
        BusinessModelsCubit.get(context).noteController.clear();
        BusinessModelsCubit.get(context).clientNameController.clear();
        BusinessModelsCubit.get(context).selectedNameClient = null;
        BusinessModelsCubit.get(context).selectedProductTypeId = null;
        BusinessModelsCubit.get(context).selectedClientId = null;
        BusinessModelsCubit.get(context).selectedProductId = null;
      },
      child: BlocBuilder<BusinessModelsCubit, BusinessModelsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: PreferredSize(
                preferredSize: preferredSize,
                child: CustomAppBar(
                    text: StringManager.businessModels.tr(context))),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 26),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProcessType(bonds: true),
                    SizedBox(height: 2.h),
                    const ProcessDataFields(),
                    SizedBox(height: 15.h),
                    const AddProduct(),
                    SizedBox(height: 10.h),
                    const ProductBill(),
                    SizedBox(height: 20.h),
                    const Notes(),
                    SizedBox(height: 5.h),
                    const ReviewData(),
                    const AddProductButton(),
                  ],
                )
              ),
            ),
          );
        },
      ),
    );
  }
}
