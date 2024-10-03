import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_cubit.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_state.dart';
import 'package:roadapp/features/business_models/presentation/views/widgets/add_product.dart';
import 'package:roadapp/features/business_models/presentation/views/widgets/notes.dart';
import 'package:roadapp/features/business_models/presentation/views/widgets/process_data_fields.dart';
import 'package:roadapp/features/business_models/presentation/views/widgets/process_type.dart';
import 'package:roadapp/features/business_models/presentation/views/widgets/product_bill.dart';

class DebenturesBusinessModelsScreen extends StatelessWidget {
  const DebenturesBusinessModelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child:
                CustomAppBar(text: StringManager.businessModels.tr(context))),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 26),
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ProcessType(bonds: true),
                      SizedBox(height: 20.h),
                      const ProcessDataFields(),
                      SizedBox(height: 10.h),
                      const AddProduct(),
                      SizedBox(height: 16.h),
                      const ProductBill(),
                      SizedBox(height: 20.h),
                      const Notes(),
                      SizedBox(height: 5.h),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            BlocBuilder<BusinessModelsCubit,
                                BusinessModelsState>(builder: (context, state) {
                              var cubit = BusinessModelsCubit.get(context);
                              return Checkbox(
                                  value: cubit.checked,
                                  onChanged: (bool? value) =>
                                      cubit.toggleCheckBox());
                            }),
                            Text(
                                StringManager.pleaseReviewDataBeforeSubmitting
                                    .tr(context),
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 11.sp))
                          ]),
                      Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.black, // Background color
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12.r)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 50.w, vertical: 7.h)),
                              onPressed: () {},
                              child: Text(StringManager.add.tr(context),
                                  style: TextStyle(
                                      color: Colors.white, // Text color
                                      fontSize: 13.sp))))
                    ]))));
  }
}