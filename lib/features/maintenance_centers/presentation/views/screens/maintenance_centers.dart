import 'package:flutter/material.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/maintenance_centers/presentation/views/widgets/maintenance_centers_grid.dart';
import 'package:roadapp/features/maintenance_centers/presentation/views/widgets/maintenance_filter.dart';

class MaintenanceCenters extends StatefulWidget {
  const MaintenanceCenters({super.key});

  @override
  State<MaintenanceCenters> createState() => _MaintenanceCentersState();
}

class _MaintenanceCentersState extends State<MaintenanceCenters> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(
                text: StringManager.coolingCycleMaintenance.tr(context))),
        body: const Padding(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
                child: Column(children: [
              MaintenanceFilter(),
              MaintenanceCentersGrid()
            ]))));
  }
}