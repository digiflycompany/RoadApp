import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/string_manager.dart';

class AccessoriesCenterDetailsChart extends StatelessWidget {
  const AccessoriesCenterDetailsChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.60,
        child: Card(
            margin: EdgeInsets.all(5.h),
            elevation: 5,
            child: Column(children: [
              Text(StringManager.customersRates.tr(context),
                  style: TextStyle(fontSize: 15.sp)),
              Text("45%", style: TextStyle(fontSize: 15.sp)),
              SizedBox(height: 25.h),
              Expanded(
                  child: BarChart(BarChartData(
                      gridData: const FlGridData(show: false),
                      maxY: 100,
                      borderData: FlBorderData(
                          border: const Border(
                              top: BorderSide.none,
                              right: BorderSide.none,
                              left: BorderSide(width: 0.5, color: Colors.grey),
                              bottom:
                                  BorderSide(width: 0.5, color: Colors.grey))),
                      barTouchData: BarTouchData(
                          enabled: false,
                          touchTooltipData: BarTouchTooltipData(
                              tooltipPadding: EdgeInsets.zero,
                              tooltipMargin: 5,
                              tooltipBgColor: Colors.transparent,
                              getTooltipItem: (BarChartGroupData group,
                                  int groupIndex,
                                  BarChartRodData rod,
                                  int rodIndex) {
                                return BarTooltipItem("${rod.toY.toInt()}%",
                                    const TextStyle(color: Colors.black));
                              })),
                      groupsSpace: 10,
                      alignment: BarChartAlignment.spaceAround,
                      titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                  reservedSize: 50.h,
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) =>
                                      bottomTitleWidgets(
                                          value, meta, context))),
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
                          color: AppColors.primaryColor,
                          rodStackItems: [
                            BarChartRodStackItem(15, 30, Colors.black)
                          ],
                          backDrawRodData:
                              BackgroundBarChartRodData(color: Colors.red))
                    ]),
                    BarChartGroupData(x: 2, showingTooltipIndicators: [
                      0
                    ], barRods: [
                      BarChartRodData(
                          toY: 30, width: 10.w, color: AppColors.primaryColor)
                    ]),
                    BarChartGroupData(x: 3, showingTooltipIndicators: [
                      0
                    ], barRods: [
                      BarChartRodData(
                          toY: 50, width: 10.w, color: AppColors.primaryColor)
                    ]),
                    BarChartGroupData(x: 4, showingTooltipIndicators: [
                      0
                    ], barRods: [
                      BarChartRodData(
                          toY: 80, width: 10.w, color: AppColors.primaryColor)
                    ]),
                    BarChartGroupData(x: 5, showingTooltipIndicators: [
                      0
                    ], barRods: [
                      BarChartRodData(
                          toY: 55, width: 10.w, color: AppColors.primaryColor)
                    ])
                  ])))
            ])));
  }

  Widget bottomTitleWidgets(
      double value, TitleMeta meta, BuildContext context) {
    late String text;
    switch (value.toInt()) {
      case 1:
        text = StringManager.professionalCompetence.tr(context);
        break;
      case 2:
        text = StringManager.fairPrice.tr(context);
        break;
      case 3:
        text = StringManager.professionalHonesty.tr(context);
        break;
      case 4:
        text = StringManager.serviceSeed.tr(context);
        break;
      case 5:
        text = StringManager.employeesBehaviour.tr(context);
        break;
    }

    return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 5,
        child: SizedBox(
            width: 60.w,
            child: Text(text,
                maxLines: 3,
                style: TextStyle(fontSize: 10.sp, height: 1.5),
                textAlign: TextAlign.center)));
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    late String text = "";
    switch (value.toInt()) {
      case 10:
        text = "10";
        break;
      case 20:
        text = "20";
        break;
      case 30:
        text = "30";
        break;
      case 40:
        text = "40";
        break;
      case 50:
        text = "50";
        break;
      case 60:
        text = "60";
        break;
      case 70:
        text = "70";
        break;
      case 80:
        text = "80";
        break;
      case 90:
        text = "90";
        break;
      case 100:
        text = "100";
        break;
    }

    return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 7,
        child: Text(
          text,
          style: TextStyle(fontSize: 8.sp),
        ));
  }
}