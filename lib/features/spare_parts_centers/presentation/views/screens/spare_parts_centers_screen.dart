import 'package:flutter/material.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/spare_parts_centers/presentation/views/widgets/spare_parts_centers_grid.dart';
import 'package:roadapp/features/spare_parts_centers/presentation/views/widgets/spare_parts_filter.dart';

class SparePartsCenters extends StatefulWidget {
  const SparePartsCenters({super.key});

  @override
  State<SparePartsCenters> createState() => _SparePartsCentersState();
}

class _SparePartsCentersState extends State<SparePartsCenters> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(text: StringManager.spareParts.tr(context))),
        body: const Padding(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
                child: Column(
                    children: [SparePartsFilter(), SparePartsCentersGrid()]))));
  }
}