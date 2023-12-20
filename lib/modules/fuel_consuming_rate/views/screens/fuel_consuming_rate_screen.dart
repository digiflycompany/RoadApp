import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/modules/fuel_consuming_rate/views/widgets/fuel_consumin_item.dart';
import 'package:roadapp2/shared/resources/colors.dart';
import 'package:roadapp2/shared/widgets/custom_appbar.dart';

class FuelConsumingRateScreen extends StatelessWidget {
  const FuelConsumingRateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child: const CustomAppBar(text: 'حساب متوسط الوقود')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      height: 30.sp,
                      width: 30.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.primaryColor,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.add),
                        onPressed: () {},
                      ))
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (item, index) {
                    return const FuelConsumingItem();
                  },
                  separatorBuilder: (item, index) {
                    return SizedBox(
                      height: 20.h,
                    );
                  },
                  itemCount: 3),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(EvaIcons.options2Outline),
                    constraints: const BoxConstraints(),
                    onPressed: () {},
                  ),
                  const Spacer(),
                  Text("عدد اللترات", style: TextStyle(fontSize: 10.sp)),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("تاريخ التفويبة",style: TextStyle(
                    fontSize: 10.sp
                  )),
                  Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.50,
                      child: BarChart(
                        BarChartData(
                          maxY: 50,
                          borderData: FlBorderData(
                            border: const Border(
                              top: BorderSide.none,
                              right: BorderSide.none,
                              left: BorderSide(width: 1),
                              bottom: BorderSide(width: 1),
                            ),
                          ),
                          groupsSpace: 10,
                          titlesData: FlTitlesData(
                            bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: bottomTitleWidgets)),
                            leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 25.w,
                              getTitlesWidget: leftTitleWidgets,
                            )),
                            rightTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            topTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                          ),
                          // add bars
                          barGroups: [
                            BarChartGroupData(
                              x: 1,
                              barRods: [
                                BarChartRodData(
                                  toY: 10,
                                  width: 10.w,
                                  color: Colors.amber,
                                  rodStackItems: [
                                    BarChartRodStackItem(15, 30, Colors.black)
                                  ],
                                  backDrawRodData: BackgroundBarChartRodData(
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            BarChartGroupData(x: 2, barRods: [
                              BarChartRodData(
                                  toY: 15, width: 10.w, color: Colors.amber),
                            ]),
                            BarChartGroupData(x: 3, barRods: [
                              BarChartRodData(
                                  toY: 25, width: 10.w, color: Colors.amber),
                            ]),
                            BarChartGroupData(x: 4, barRods: [
                              BarChartRodData(
                                  toY: 35, width: 10.w, color: Colors.amber),
                            ]),
                          ],
                          extraLinesData: const ExtraLinesData(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Container(
                color: AppColors.whiteColor2,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child:  Column(
                    children: [
                      const Row(
                        children: [
                          Expanded(child: Row(
                            children: [
                              Text("اجمالي كيلومترات:",
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),)
                            ],
                          )),
                          Expanded(child: Row(
                            children: [
                              Text("استهلاك اللترات:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),)
                            ],
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      const Row(
                        children: [
                          Text("اجمالي التكلفة:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget fuelConsumingItem() {
  //   return Container(
  //     decoration: BoxDecoration(
  //         color: AppColors.whiteColor2, borderRadius: BorderRadius.circular(12)),
  //     child: Column(
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Row(
  //             children: [
  //               Expanded(
  //                 child: Row(
  //                   children: [
  //                     SvgPicture.asset(
  //                       AppImages.fuelCounter,
  //                       height: 17.h,
  //                       width: 17.w,
  //                     ),
  //                     SizedBox(
  //                       width: 5.w,
  //                     ),
  //                     Text(
  //                       "العداد قبل اضافة الوقود:",
  //                       style: TextStyle(fontSize: 11.sp),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               Expanded(
  //                 child: Row(
  //                   children: [
  //                     SvgPicture.asset(AppImages.kmBoard,
  //                         height: 17.h, width: 17.w),
  //                     SizedBox(
  //                       width: 5.w,
  //                     ),
  //                     Text(
  //                       "عدد الكيلوهات:",
  //                       style: TextStyle(fontSize: 11.sp),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         divider(),
  //         Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Row(
  //             children: [
  //               Expanded(
  //                 child: Row(
  //                   children: [
  //                     SvgPicture.asset(
  //                       AppImages.kmBoard,
  //                       height: 17.h,
  //                       width: 17.w,
  //                     ),
  //                     SizedBox(
  //                       width: 5.w,
  //                     ),
  //                     Text(
  //                       "عدد الكيلوهات / جم:",
  //                       style: TextStyle(fontSize: 11.sp),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               Expanded(
  //                 child: Row(
  //                   children: [
  //                     SvgPicture.asset(
  //                       AppImages.kmBoard,
  //                       height: 17.h,
  //                       width: 17.w,
  //                     ),
  //                     SizedBox(
  //                       width: 5.w,
  //                     ),
  //                     Text(
  //                       "عدد الكيلوهات / لتر:",
  //                       style: TextStyle(fontSize: 11.sp),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         divider(),
  //         Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Row(
  //             children: [
  //               Expanded(
  //                 child: Row(
  //                   children: [
  //                     SvgPicture.asset(
  //                       AppImages.fuelGun,
  //                       height: 17.h,
  //                       width: 17.w,
  //                     ),
  //                     SizedBox(
  //                       width: 5.w,
  //                     ),
  //                     Text(
  //                       "عدد اللترات:",
  //                       style: TextStyle(fontSize: 11.sp),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               Expanded(
  //                 child: Row(
  //                   children: [
  //                     SvgPicture.asset(
  //                       AppImages.moneyIcon,
  //                       height: 17.h,
  //                       width: 17.w,
  //                     ),
  //                     SizedBox(
  //                       width: 5.w,
  //                     ),
  //                     Text("سعر اللتر:", style: TextStyle(fontSize: 11.sp)),
  //                   ],
  //                 ),
  //               ),
  //               Expanded(
  //                 child: Row(
  //                   children: [
  //                     SvgPicture.asset(
  //                       AppImages.moneyIcon,
  //                       height: 17.h,
  //                       width: 17.w,
  //                     ),
  //                     SizedBox(
  //                       width: 5.w,
  //                     ),
  //                     Text("سعر التفويله:", style: TextStyle(fontSize: 11.sp)),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

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
        space: 7,
        child: FittedBox(child: Text(text, maxLines: 2)));
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
        ));
  }
}
