import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/views/widgets/diagram_1st_filter.dart';
import 'package:roadapp/features/fuel_consuming_rate/presentation/views/widgets/fuel_chart.dart';

import '../../cubit/cubit.dart';

class FuelDiagram extends StatefulWidget {
  const FuelDiagram({super.key});

  @override
  State<FuelDiagram> createState() => _FuelDiagramState();
}

class _FuelDiagramState extends State<FuelDiagram> {
  int selectedFilter = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5.h),
        margin: EdgeInsets.all(5.h),
      //  height: MediaQuery.of(context).size.height * 0.60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Color(0xFFD7D7D7),
                  blurRadius: 10,
                  offset: Offset(0, 2))
            ]),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: DropdownButton<int>(
                value: selectedFilter,
                items: const [
                  DropdownMenuItem(value: 1, child: Text('الشهر الحالي')),
                  DropdownMenuItem(value: 3, child: Text('آخر 3 أشهر')),
                  DropdownMenuItem(value: 6, child: Text('آخر 6 أشهر')),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedFilter = value;
                    });
                    // استدعاء fetchChart عند تغيير الفلتر
                    FuelConsumingRateCubit.get(context).fetchChart(selectedFilter);
                  }
                },
              ),
            ),
            const Spacer(),
            Text(StringManager.liters.tr(context),
                style: TextStyle(fontSize: 10.sp))
          ]),
          SizedBox(height: 10.h),
          Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(StringManager.km.tr(context),
                style: TextStyle(fontSize: 10.sp)),
            Center(child: FuelChart(selectedFilter: selectedFilter,))
          ])
        ]));
  }
}