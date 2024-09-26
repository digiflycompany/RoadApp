import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/features/fuel_consuming_rate/views/widgets/diagram_1st_filter.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/cubit.dart';

class FuelDiagram extends StatelessWidget {
  const FuelDiagram({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.h),
        margin: EdgeInsets.all(5.h),
        height: MediaQuery.of(context).size.height * 0.60,
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
            Diagram1stFilter(),
            const Spacer(),
            Text(StringManager.liters.tr(context),
                style: TextStyle(fontSize: 10.sp))
          ]),
          SizedBox(height: 10.h),
          Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(StringManager.fuelingDate.tr(context),
                style: TextStyle(fontSize: 10.sp)),
            Expanded(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.50,
                    child: BarChart(BarChartData(
                        maxY: 50,
                        gridData: const FlGridData(show: false),
                        barTouchData: BarTouchData(
                            enabled: false,
                            touchTooltipData: BarTouchTooltipData(
                              tooltipPadding: EdgeInsets.zero,
                              tooltipMargin: 0,
                              tooltipBgColor: Colors.transparent,
                              getTooltipItem: (BarChartGroupData group,
                                  int groupIndex,
                                  BarChartRodData rod,
                                  int rodIndex) {
                                return BarTooltipItem(
                                  "${rod.toY.toInt()}",
                                  const TextStyle(color: Colors.black),
                                );
                              },
                            )),
                        borderData: FlBorderData(
                            border: const Border(
                                top: BorderSide.none,
                                right: BorderSide.none,
                                left:
                                    BorderSide(width: 0.5, color: Colors.grey),
                                bottom: BorderSide(
                                    width: 0.5, color: Colors.grey))),
                        groupsSpace: 10,
                        alignment: BarChartAlignment.spaceAround,
                        titlesData: FlTitlesData(
                            bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                    reservedSize: 40.h,
                                    showTitles: true,
                                    getTitlesWidget: bottomTitleWidgets)),
                            leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 25.w,
                                    getTitlesWidget: leftTitleWidgets)),
                            rightTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            topTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false))),
                        barGroups: [
                          BarChartGroupData(x: 1, showingTooltipIndicators: [
                            0
                          ], barRods: [
                            BarChartRodData(
                                toY: 10,
                                width: 10.w,
                                color: Colors.amber,
                                rodStackItems: [
                                  BarChartRodStackItem(15, 30, Colors.black)
                                ],
                                backDrawRodData: BackgroundBarChartRodData(
                                    color: Colors.red))
                          ]),
                          BarChartGroupData(x: 2, showingTooltipIndicators: [
                            0
                          ], barRods: [
                            BarChartRodData(
                                toY: 15, width: 10.w, color: Colors.amber)
                          ]),
                          BarChartGroupData(x: 3, showingTooltipIndicators: [
                            0
                          ], barRods: [
                            BarChartRodData(
                                toY: 25, width: 10.w, color: Colors.amber)
                          ]),
                          BarChartGroupData(x: 4, showingTooltipIndicators: [
                            0
                          ], barRods: [
                            BarChartRodData(
                                toY: 35, width: 10.w, color: Colors.amber)
                          ])
                        ],
                        extraLinesData: const ExtraLinesData()))))
          ])
        ]));
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    late String text;
    switch (value.toInt()) {
      case 1:
        text = "30 يناير";
        break;
      case 2:
        text = "25 يناير";
        break;
      case 3:
        text = "15 يناير";
        break;
      case 4:
        text = "1 يناير";
        break;
    }
    return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 10,
        child: SizedBox(
          width: 50.w,
          child: Text(
            text,
            maxLines: 2,
            style: TextStyle(fontSize: 10.sp, height: 1.1),
            textAlign: TextAlign.center,
          ),
        ));
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    late String text = "";
    switch (value.toInt()) {
      case 5:
        text = "5";
        break;
      case 10:
        text = "10";
        break;
      case 15:
        text = "15";
        break;
      case 20:
        text = "20";
        break;
      case 25:
        text = "25";
        break;
      case 30:
        text = "30";
        break;
      case 35:
        text = "35";
        break;
      case 40:
        text = "40";
        break;
      case 45:
        text = "45";
        break;
      case 50:
        text = "50";
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 7,
      child: Text(
        text,
        style: const TextStyle(fontSize: 10),
      ),
    );
  }
}