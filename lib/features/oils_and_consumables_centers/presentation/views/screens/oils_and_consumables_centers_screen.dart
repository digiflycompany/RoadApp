import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/oils_and_consumables_centers/presentation/views/widgets/oils_and_consumables_center_item.dart';
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
    var width = MediaQuery.of(context).size.width,
        height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(
                text: StringManager.oilsAndConsumables.tr(context))),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
                child: Column(children: [
              const OilsAndConsumablesFilter(),
              GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent:
                          height >= 1000 ? (height >= 1200 ? 216.2 : 210) : 180,
                      mainAxisSpacing: 10.h,
                      crossAxisCount: width >= 500 ? 4 : 2),
                  itemBuilder: (context, index) {
                    return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: OilsAndConsumablesCentersItem());
                  },
                  itemCount: 27)
            ]))));
  }
}