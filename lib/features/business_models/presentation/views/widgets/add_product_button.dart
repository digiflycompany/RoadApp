import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/functions/toast.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_cubit.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_state.dart';

class AddProductButton extends StatelessWidget {
  const AddProductButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BusinessModelsCubit, BusinessModelsState>(
      listener: (context, state) {
        if(state is AddPaymentVoucherErrorState){
          showToast(message: state.error, state: ToastStates.error);
        }else if(state is AddPaymentVoucherSuccessState){
          showToast(message: 'Success', state: ToastStates.success);
        }else if(state is AddBillOfSellVoucherSuccessState){
          showToast(message: 'Success', state: ToastStates.success);
        }else if(state is AddReceiptVoucherSuccessState){
          showToast(message: 'Success', state: ToastStates.success);
        }

      },
      builder: (context, state) {
        var cubit = BusinessModelsCubit.get(context);
        return Center(
          child: state is AddPaymentVoucherLoadingState
              ? const CircularProgressIndicator()
              : ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Background color
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r)),
                  padding: EdgeInsets.symmetric(
                      horizontal: 50.w, vertical: 7.h)),
              onPressed: () {
                if(cubit.noteController.text.isEmpty){
                  showToast(message: 'Enter Your Note', state: ToastStates.error);
                }else if(cubit.productsAdd.isEmpty){
                  showToast(message: 'Enter Products', state: ToastStates.error);
                }
                else{
                  cubit.createVoucher();
                }
              },
              child: Text(StringManager.add.tr(context),
                  style: TextStyle(
                      color: Colors.white, // Text color
                      fontSize: 13.sp))),
        );
      },
    );
  }
}