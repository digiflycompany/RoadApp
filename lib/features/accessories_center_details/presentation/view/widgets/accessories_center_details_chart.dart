import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/string_manager.dart';

class AccessoriesCenterDetailsChart extends StatelessWidget {
  const AccessoriesCenterDetailsChart({
    super.key,
    this.employeesBehavior,
    this.speed,
    this.honesty,
    this.fairCost,
    this.efficiency,
    this.allRav,
  });

  final int? allRav;
  final int? employeesBehavior;
  final int? speed;
  final int? honesty;
  final int? fairCost;
  final int? efficiency;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.60,
      child: Stack(
        alignment: Alignment.center,
        children: [
          /// Chart (disabled interaction)
          IgnorePointer(
            ignoring: true, // makes chart not clickable
            child: Card(
              margin: EdgeInsets.all(5.h),
              elevation: 5,
              child: Column(
                children: [
                  Text(
                    StringManager.customersRates.tr(context),
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  Text("${allRav ?? 0}%", style: TextStyle(fontSize: 15.sp)),
                  SizedBox(height: 25.h),
                  Expanded(
                    child: BarChart(
                      BarChartData(
                        gridData: const FlGridData(show: false),
                        maxY: 100,
                        borderData: FlBorderData(
                          border: const Border(
                            top: BorderSide.none,
                            right: BorderSide.none,
                            left: BorderSide(width: 0.5, color: Colors.grey),
                            bottom: BorderSide(width: 0.5, color: Colors.grey),
                          ),
                        ),
                        barTouchData: BarTouchData(enabled: false),
                        groupsSpace: 10,
                        alignment: BarChartAlignment.spaceAround,
                        titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              reservedSize: 50.h,
                              showTitles: true,
                              getTitlesWidget: (value, meta) =>
                                  bottomTitleWidgets(value, meta, context),
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 25.w,
                              getTitlesWidget: leftTitleWidgets,
                            ),
                          ),
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),
                        barGroups: [
                          BarChartGroupData(
                            x: 1,
                            barRods: [
                              BarChartRodData(
                                toY: employeesBehavior?.toDouble() ?? 10,
                                width: 10.w,
                                color: AppColors.primaryColor,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 2,
                            barRods: [
                              BarChartRodData(
                                toY: speed?.toDouble() ?? 30,
                                width: 10.w,
                                color: AppColors.primaryColor,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 3,
                            barRods: [
                              BarChartRodData(
                                toY: honesty?.toDouble() ?? 50,
                                width: 10.w,
                                color: AppColors.primaryColor,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 4,
                            barRods: [
                              BarChartRodData(
                                toY: fairCost?.toDouble() ?? 80,
                                width: 10.w,
                                color: AppColors.primaryColor,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 5,
                            barRods: [
                              BarChartRodData(
                                toY: efficiency?.toDouble() ?? 55,
                                width: 10.w,
                                color: AppColors.primaryColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Semi-transparent overlay
          Container(
            color: Colors.white.withOpacity(0.7),
          ),

          /// "Soon" SVG on top
          Center(
            child: SvgPicture.asset(
              'assets/images/soon.svg',
              width: 80.w,
              height: 110.h,
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta, BuildContext context) {
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
      default:
        text = "";
    }

    return SideTitleWidget(
      meta: meta, // ✅ required in newer fl_chart versions
      space: 5,
      child: SizedBox(
        width: 60.w,
        child: Text(
          text,
          maxLines: 3,
          style: TextStyle(fontSize: 10.sp, height: 1.5),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    final labels = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100};

    return SideTitleWidget(
      meta: meta, // ✅ required in newer fl_chart versions
      space: 7,
      child: Text(
        labels.contains(value.toInt()) ? value.toInt().toString() : "",
        style: TextStyle(fontSize: 8.sp),
      ),
    );
  }
}