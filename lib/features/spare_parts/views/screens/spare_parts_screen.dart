import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/search_row.dart';
import 'package:roadapp/features/spare_parts/views/widgets/spare_parts_grid.dart';

class SparePartsScreen extends StatelessWidget {
  const SparePartsScreen({super.key, required this.countries, required this.carBrandId});

  final String countries;
  final String carBrandId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(text: StringManager.spareParts.tr(context))),
        body: Padding(
            padding: EdgeInsets.all(20.r),
            child: SingleChildScrollView(
                child: Column(children: [
              const SearchRow(),
              SizedBox(height: 30.h),
              const SparePartsGrid()
            ]))));
  }
}