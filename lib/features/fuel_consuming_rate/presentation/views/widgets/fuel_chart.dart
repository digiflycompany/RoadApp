import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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
        final rates = cubit.rates;

        final now = DateTime.now();
        final startDate = DateTime(now.year, now.month - selectedFilter, 1);

        // تصفية البيانات بناءً على الفترة المحددة
        final filteredRates = rates.where((rate) {
          if (rate.createdAt == null || rate.kmCount == null || rate.literCount == null) return false;
          final date = DateTime.parse(rate.createdAt!);
          return date.isAfter(startDate) && date.isBefore(now);
        }).toList();

        // حساب إجمالي الكيلومترات واللترات المستهلكة
        final totalKm = filteredRates.fold<double>(0, (sum, rate) => sum + (rate.kmCount ?? 0).toDouble());
        final totalLiters = filteredRates.fold<double>(0, (sum, rate) => sum + (rate.literCount ?? 0).toDouble());


        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 350, // تحديد ارتفاع مناسب
            width: 240, // عرض مناسب للبار
            child: BarChart(
              BarChartData(
                maxY: totalLiters.toDouble() + 10, // زيادة بسيطة لضمان مساحة كافية
                gridData: const FlGridData(show: true),
                barTouchData: BarTouchData(
                  enabled: true,
                  touchTooltipData: BarTouchTooltipData(
                    tooltipBgColor: Colors.black.withOpacity(0.7),
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      return BarTooltipItem(
                        "${rod.toY.toInt()} لتر\n$totalKm كم",
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
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          space: 8,
                          child: Text("$totalKm كم", style: const TextStyle(fontSize: 10)),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          space: 5,
                          child: Text(value.toInt().toString(), style: const TextStyle(fontSize: 10)),
                        );
                      },
                    ),
                  ),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                barGroups: [
                  BarChartGroupData(
                    x: 0,
                    barRods: [
                      BarChartRodData(
                        toY: totalLiters.toDouble(),
                        width: 30,
                        color: Colors.amber,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// Done This
// class FuelChart extends StatelessWidget {
//   const FuelChart({super.key, required this.selectedFilter});
//   final int selectedFilter;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<FuelConsumingRateCubit, FuelConsumingRateStates>(
//       builder: (context, state) {
//         final cubit = FuelConsumingRateCubit.get(context);
//         final rates = cubit.rates;
//
//         final now = DateTime.now();
//         final startDate = DateTime(now.year, now.month - selectedFilter, 1);
//
//         // تصفية البيانات بناءً على عدد الأشهر المحدد
//         final filteredRates = rates.where((rate) {
//           if (rate.createdAt == null) return false;
//           final date = DateTime.parse(rate.createdAt!);
//           return date.isAfter(startDate) && date.isBefore(now);
//         }).toList();
//
//         return Expanded(
//           child: SizedBox(
//             height: MediaQuery.of(context).size.height * 0.50,
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: SizedBox(
//                 width: filteredRates.length * 50, // تحديد عرض كافٍ للأعمدة
//                 child: BarChart(
//                   BarChartData(
//                     maxY: filteredRates.isNotEmpty
//                         ? filteredRates.map((r) => r.literCount).reduce((a, b) => a! > b! ? a : b)! + 20
//                         : 60,
//                     gridData: const FlGridData(show: true),
//                     barTouchData: BarTouchData(
//                       enabled: true,
//                       touchTooltipData: BarTouchTooltipData(
//                         tooltipBgColor: Colors.black.withOpacity(0.7),
//                         getTooltipItem: (group, groupIndex, rod, rodIndex) {
//                           return BarTooltipItem(
//                             "${rod.toY.toInt()} لتر",
//                             const TextStyle(color: Colors.white),
//                           );
//                         },
//                       ),
//                     ),
//                     borderData: FlBorderData(
//                       border: const Border(
//                         top: BorderSide.none,
//                         right: BorderSide.none,
//                         left: BorderSide(width: 0.5, color: Colors.grey),
//                         bottom: BorderSide(width: 0.5, color: Colors.grey),
//                       ),
//                     ),
//                     titlesData: FlTitlesData(
//                       bottomTitles: AxisTitles(
//                         sideTitles: SideTitles(
//                           showTitles: true,
//                           getTitlesWidget: (value, meta) {
//                             if (value.toInt() >= filteredRates.length) return const SizedBox();
//                             return SideTitleWidget(
//                               axisSide: meta.axisSide,
//                               space: 5,
//                               child: Text(
//                                 DateFormat('dd MMM').format(DateTime.parse(filteredRates[value.toInt()].createdAt!)),
//                                 style: const TextStyle(fontSize: 10),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       leftTitles: AxisTitles(
//                         sideTitles: SideTitles(
//                           showTitles: true,
//                           getTitlesWidget: (value, meta) {
//                             return SideTitleWidget(
//                               axisSide: meta.axisSide,
//                               space: 5,
//                               child: Text(value.toInt().toString(), style: const TextStyle(fontSize: 10)),
//                             );
//                           },
//                         ),
//                       ),
//                       topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
//                       rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
//                     ),
//                     barGroups: List.generate(
//                       filteredRates.length,
//                           (index) => BarChartGroupData(
//                         x: index,
//                         barRods: [
//                           BarChartRodData(
//                             toY: filteredRates[index].literCount!.toDouble(),
//                             width: 15,
//                             color: Colors.amber,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class FuelChart extends StatelessWidget {
//   const FuelChart({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//         child: SizedBox(
//             height: MediaQuery.of(context).size.height * 0.50,
//             child: BarChart(BarChartData(
//                 maxY: 50,
//                 gridData: const FlGridData(show: false),
//                 barTouchData: BarTouchData(
//                     enabled: false,
//                     touchTooltipData: BarTouchTooltipData(
//                         tooltipPadding: EdgeInsets.zero,
//                         tooltipMargin: 0,
//                         tooltipBgColor: Colors.transparent,
//                         getTooltipItem: (BarChartGroupData group,
//                             int groupIndex, BarChartRodData rod, int rodIndex) {
//                           return BarTooltipItem("${rod.toY.toInt()}",
//                               const TextStyle(color: Colors.black));
//                         })),
//                 borderData: FlBorderData(
//                     border: const Border(
//                         top: BorderSide.none,
//                         right: BorderSide.none,
//                         left: BorderSide(width: 0.5, color: Colors.grey),
//                         bottom: BorderSide(width: 0.5, color: Colors.grey))),
//                 groupsSpace: 10,
//                 alignment: BarChartAlignment.spaceAround,
//                 titlesData: FlTitlesData(
//                     bottomTitles: AxisTitles(
//                         sideTitles: SideTitles(
//                             reservedSize: 40.h,
//                             showTitles: true,
//                             getTitlesWidget: bottomTitleWidgets)),
//                     leftTitles: AxisTitles(
//                         sideTitles: SideTitles(
//                             showTitles: true,
//                             reservedSize: 25.w,
//                             getTitlesWidget: leftTitleWidgets)),
//                     rightTitles: const AxisTitles(
//                         sideTitles: SideTitles(showTitles: false)),
//                     topTitles: const AxisTitles(
//                         sideTitles: SideTitles(showTitles: false))),
//                 barGroups: [
//                   BarChartGroupData(x: 1, showingTooltipIndicators: [
//                     0
//                   ], barRods: [
//                     BarChartRodData(
//                         toY: 10,
//                         width: 10.w,
//                         color: Colors.amber,
//                         rodStackItems: [
//                           BarChartRodStackItem(15, 30, Colors.black)
//                         ],
//                         backDrawRodData:
//                             BackgroundBarChartRodData(color: Colors.red))
//                   ]),
//                   BarChartGroupData(x: 2, showingTooltipIndicators: [
//                     0
//                   ], barRods: [
//                     BarChartRodData(toY: 15, width: 10.w, color: Colors.amber)
//                   ]),
//                   BarChartGroupData(x: 3, showingTooltipIndicators: [
//                     0
//                   ], barRods: [
//                     BarChartRodData(toY: 25, width: 10.w, color: Colors.amber)
//                   ]),
//                   BarChartGroupData(x: 4, showingTooltipIndicators: [
//                     0
//                   ], barRods: [
//                     BarChartRodData(toY: 35, width: 10.w, color: Colors.amber)
//                   ])
//                 ],
//                 extraLinesData: const ExtraLinesData()))));
//   }
//
//   Widget bottomTitleWidgets(double value, TitleMeta meta) {
//     late String text;
//     switch (value.toInt()) {
//       case 1:
//         text = "30 يناير";
//         break;
//       case 2:
//         text = "25 يناير";
//         break;
//       case 3:
//         text = "15 يناير";
//         break;
//       case 4:
//         text = "1 يناير";
//         break;
//     }
//     return SideTitleWidget(
//         axisSide: meta.axisSide,
//         space: 10,
//         child: SizedBox(
//             width: 50.w,
//             child: Text(text,
//                 maxLines: 2,
//                 style: TextStyle(fontSize: 10.sp, height: 1.1),
//                 textAlign: TextAlign.center)));
//   }
//
//   Widget leftTitleWidgets(double value, TitleMeta meta) {
//     late String text = "";
//     switch (value.toInt()) {
//       case 5:
//         text = "5";
//         break;
//       case 10:
//         text = "10";
//         break;
//       case 15:
//         text = "15";
//         break;
//       case 20:
//         text = "20";
//         break;
//       case 25:
//         text = "25";
//         break;
//       case 30:
//         text = "30";
//         break;
//       case 35:
//         text = "35";
//         break;
//       case 40:
//         text = "40";
//         break;
//       case 45:
//         text = "45";
//         break;
//       case 50:
//         text = "50";
//         break;
//     }
//
//     return SideTitleWidget(
//         axisSide: meta.axisSide,
//         space: 7,
//         child: Text(text, style: const TextStyle(fontSize: 10)));
//   }
// }