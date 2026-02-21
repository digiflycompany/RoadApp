import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/theming/colors.dart';
import 'package:roadapp/core/widgets/custom_loading_indicator.dart';

import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

class FuelChart extends StatelessWidget {
  const FuelChart({super.key, required this.selectedFilter});
  final int selectedFilter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FuelConsumingRateCubit, FuelConsumingRateStates>(
      builder: (context, state) {
        final cubit = FuelConsumingRateCubit.get(context);
        final chartData = cubit.chartDataList;

        if (chartData.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "لا توجد بيانات متاحة",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        }

        if (state is ChartLoadingState) {
          return CustomLoadingIndicator(
            height: 400,
            width: MediaQuery.of(context).size.width / 1.5,
          );
        }

        final maxLiters = chartData
            .map((e) => e.liters.toDouble())
            .reduce((a, b) => a > b ? a : b);

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 400,
            width: 250,
            child: BarChart(
              BarChartData(
                maxY: maxLiters + 10,
                gridData: const FlGridData(show: true),
                barTouchData: BarTouchData(
                  enabled: true,
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (group) => Colors.black.withOpacity(0.7),
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      final data = chartData[groupIndex];
                      return BarTooltipItem(
                        "${data.liters} لتر\n${data.km} كم\n${data.label} شهر",
                        const TextStyle(color: Colors.white),
                      );
                    },
                  ),
                ),
                borderData: FlBorderData(
                  border: const Border(
                    top: BorderSide.none,
                    right: BorderSide.none,
                    left: BorderSide(width: 0.5, color: Colors.grey),
                    bottom: BorderSide(width: 0.5, color: Colors.grey),
                  ),
                ),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      reservedSize: 90,
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        if (index < 0 || index >= chartData.length) {
                          return const SizedBox.shrink();
                        }

                        return SideTitleWidget(
                          meta: meta, // ✅ NEW API
                          space: 8,
                          child: Text(
                            "Km\n${chartData[index].km} \nMon \n${chartData[index].label}",
                            style: const TextStyle(fontSize: 10),
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      reservedSize: 35,
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return SideTitleWidget(
                          meta: meta, // ✅ NEW API
                          space: 3,
                          child: Text(
                            value.toInt().toString(),
                            style: const TextStyle(fontSize: 10),
                          ),
                        );
                      },
                    ),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                barGroups: chartData
                    .asMap()
                    .entries
                    .map(
                      (entry) => BarChartGroupData(
                    x: entry.key,
                    barRods: [
                      BarChartRodData(
                        toY: entry.value.liters.toDouble(),
                        color: AppColors.primaryColor,
                        width: 20,
                      ),
                    ],
                  ),
                )
                    .toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}