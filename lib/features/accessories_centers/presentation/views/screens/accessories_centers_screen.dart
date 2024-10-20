import 'package:flutter/material.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/accessories_centers/presentation/views/widgets/accessories_center_grid.dart';
import 'package:roadapp/features/accessories_centers/presentation/views/widgets/accessories_filter.dart';

class AccessoriesCentersScreen extends StatelessWidget {
  const AccessoriesCentersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(text: StringManager.accessories.tr(context))),
        body: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
                child: Column(children: [
              AccessoriesFilter(),
              AccessoriesCenterGrid()
            ]))));
  }
}