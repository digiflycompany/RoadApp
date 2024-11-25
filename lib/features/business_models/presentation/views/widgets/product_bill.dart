import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/business_models/presentation/manager/business_models_state.dart';

import '../../manager/business_models_cubit.dart';

class ProductBill extends StatelessWidget {
  const ProductBill({super.key});

  @override
  Widget build(BuildContext context) {
    int index = 1 ;
    return BlocBuilder<BusinessModelsCubit, BusinessModelsState>(
  builder: (context, state) {
    var cubit = BusinessModelsCubit.get(context);

    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.r),
              topRight: Radius.circular(15.r),
            ),
            child: DataTable(
              columnSpacing: 13.w,
              headingRowHeight: 40.h,
              dataRowMinHeight: 40.h,
              headingRowColor:
              MaterialStateColor.resolveWith((states) => Colors.black),
              headingTextStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              columns: [
                DataColumn(label: Text(StringManager.t.tr(context))),
               // DataColumn(label: Text(StringManager.itemCode.tr(context))),
                DataColumn(label: Text(StringManager.itemName.tr(context))),
                DataColumn(label: Text(StringManager.quantity.tr(context))),
                DataColumn(label: Text(StringManager.price.tr(context))),
                //DataColumn(label: Text(StringManager.value.tr(context))),
              ],
              rows: cubit.dataRow.map((item) {
                return DataRow(
                  cells: [
                    DataCell(Text('${index++}', style: TextStyle(fontSize: 12.sp,))),
                    DataCell(Text(item.name, style: TextStyle(fontSize: 11.sp))),
                    DataCell(Text(item.quantity, style: TextStyle(fontSize: 12.sp))),
                    DataCell(Text(item.price, style: TextStyle(fontSize: 12.sp))),
                    //DataCell(Text(item.value, style: TextStyle(fontSize: 12.sp))),
                  ],
                  color: WidgetStateProperty.resolveWith<Color?>(
                        (Set<WidgetState> states) {
                      return Colors.amber[100]; // Use the color you need
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.amber[100],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.r),
              bottomRight: Radius.circular(15.r),
            ),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Text(
            StringManager.total.tr(context),
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  },
);
  }
}
