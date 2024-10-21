import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/vehicles_category/cubit/cubit.dart';
import 'package:roadapp/features/vehicles_category/views/widgets/select_category_button.dart';
import 'package:roadapp/features/vehicles_category/views/widgets/vehicle_category_row.dart';

class VehiclesCategoryScreen extends StatelessWidget {
  const VehiclesCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child:
                CustomAppBar(text: StringManager.chooseCategory.tr(context))),
        body: BlocProvider<VehiclesCategoryCubit>(
            create: (BuildContext context) => VehiclesCategoryCubit(),
            child: const Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 15, end: 15, top: 15, bottom: 8),
                child: Expanded(
                    child: Column(children: [
                  VehicleCategoryRow(),
                  Spacer(),
                  SelectCategoryButton()
                ])))));
  }
}