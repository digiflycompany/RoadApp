import 'package:flutter/material.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/oils_and_consumables_centers/presentation/views/widgets/oils_and_consumables_centers_grid.dart';
import 'package:roadapp/features/oils_and_consumables_centers/presentation/views/widgets/oils_and_consumables_filter.dart';

class OilsAndConsumablesCentersScreen extends StatefulWidget {
  const OilsAndConsumablesCentersScreen({super.key});

  @override
  State<OilsAndConsumablesCentersScreen> createState() =>
      _OilsAndConsumablesCentersScreenState();
}

class _OilsAndConsumablesCentersScreenState
    extends State<OilsAndConsumablesCentersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(
                text: StringManager.oilsAndConsumables.tr(context))),
        body: const Padding(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
                child: Column(children: [
              OilsAndConsumablesFilter(),
              OilsAndConsumablesCentersGrid()
            ]))));
  }
}