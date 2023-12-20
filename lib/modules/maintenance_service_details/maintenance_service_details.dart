import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roadapp2/shared/const/app_images.dart';

import '../../shared/resources/colors.dart';
import '../../shared/widgets/custom_appbar.dart';

class MaintenanceServiceDetails extends StatelessWidget {
  const MaintenanceServiceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child: const CustomAppBar(text: 'خدمة الصيانة')),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(
                        height: 150.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        AppImages.carServiceWorker),
                    Container(
                      width: double.infinity,
                      height: 30.h,
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      color: AppColors.secondColor.withOpacity(0.56),
                      child: Row(
                        children: [
                          Text(
                            "مركز الوكيل",
                            style: TextStyle(
                                fontSize: 9.sp, color: AppColors.tertiary),
                          ),
                          const Spacer(),
                          Text(
                            "عباس العقاد - مدينة نصر",
                            style: TextStyle(
                                fontSize: 9.sp, color: AppColors.tertiary),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Row(
                  children: [
                    const Icon(Icons.phone_enabled, size: 18),
                    const SizedBox(width: 3),
                    Text(
                      "0123456789",
                      style: TextStyle(
                          fontSize: 9.sp, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    "صيانة دورة التبريد",
                    style:
                        TextStyle(fontSize: 9.sp, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(
                    "السعر: 320 جنيه",
                    style:
                        TextStyle(fontSize: 9.sp, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Text(
                "خدمات اخرى",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11.sp),
              ),
              SingleChildScrollView(
                padding: EdgeInsets.only(top: 17.h),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    otherServiceItem(),
                    SizedBox(width: 10.w),
                    otherServiceItem(),
                    otherServiceItem(),
                    otherServiceItem(),
                  ],
                ),
              ),
              SizedBox(height: 50.h),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.50,
                width: MediaQuery.of(context).size.width,
                child: BarChart(
                  BarChartData(
                    maxY: 100,
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
                            toY: 30, width: 10.w, color: Colors.amber),
                      ], ),
                      BarChartGroupData(x: 3, barRods: [
                        BarChartRodData(
                            toY: 50, width: 10.w, color: Colors.amber),
                      ], ),
                      BarChartGroupData(x: 4, barRods: [
                        BarChartRodData(
                            toY: 80, width: 10.w, color: Colors.amber),
                      ], ),
                      BarChartGroupData(
                        x: 5,
                        barRods: [
                          BarChartRodData(
                            toY: 55,
                            width: 10.w,
                            color: Colors.amber,
                          ),
                        ],

                      ),
                    ],

                    extraLinesData: const ExtraLinesData(),
                  ),
                ),
              ),
              // SizedBox(
              //     height: 500.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget otherServiceItem() {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
              height: 80.h,
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              width: 80.w,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20.r)),
              child: SvgPicture.asset(
                  width: 30.w,
                  height: 30.h,
                  fit: BoxFit.scaleDown,
                 AppImages.wrench)),
          SizedBox(height: 10.h),
          Text(
            "صيانة دورة التبريد",
            style: TextStyle(fontSize: 9.sp),
          ),
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    //  const style = TextStyle();

    late String text;
    switch (value.toInt()) {
      case 1:
        text = "سلوك العاملين";
        break;
      case 2:
        text = "سرعة الخدمة";
        break;
      case 3:
        text = "السعر العادل";
        break;
      case 4:
        text = "الأمانة المهنية";
        break;
      case 5:
        text = "الكفاءة المهنية";
        break;
    }

    return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 7,
        child: FittedBox(child: Text(text, maxLines: 2)));
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    //  const style = TextStyle();

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
          style: const TextStyle(fontSize: 10),
        ));
  }
}
