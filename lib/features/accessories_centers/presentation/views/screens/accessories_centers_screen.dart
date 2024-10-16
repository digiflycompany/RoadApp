import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/accessories_centers/presentation/views/widgets/accessories_center_item.dart';
import 'package:roadapp/features/accessories_centers/presentation/views/widgets/accessories_filter.dart';

class AccessoriesCentersScreen extends StatelessWidget {
  const AccessoriesCentersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width,
        height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(text: StringManager.accessories.tr(context))),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
                child: Column(children: [
              const AccessoriesFilter(),
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
                        child: AccessoriesCentersItem());
                  },
                  itemCount: 27)
            ]))));
  }
}