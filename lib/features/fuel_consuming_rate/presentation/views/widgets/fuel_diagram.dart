import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/views/widgets/diagram_1st_filter.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/views/widgets/fuel_chart.dart';

class FuelDiagram extends StatelessWidget {
  const FuelDiagram({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.h),
        margin: EdgeInsets.all(5.h),
        height: MediaQuery.of(context).size.height * 0.70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Color(0xFFD7D7D7),
                  blurRadius: 10,
                  offset: Offset(0, 2))
            ]),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            const Diagram1stFilter(),
            const Spacer(),
            Text(StringManager.liters.tr(context),
                style: TextStyle(fontSize: 10.sp))
          ]),
          SizedBox(height: 10.h),
          Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(StringManager.fuelingDate.tr(context),
                style: TextStyle(fontSize: 10.sp)),
            const FuelChart()
          ])
        ]));
  }
}