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
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      color: AppColors.secondColor.withOpacity(0.56),
                      child: Row(
                        children: [
                          Text(
                            "مركز الوكيل",
                            style: TextStyle(
                                fontSize: 9.sp, color: AppColors.tertiary),
                          ),
                          const Spacer(),
                          SvgPicture.asset(
                            AppImages.pinIcon,
                            height: 7.h,
                            width: 7.w,
                            colorFilter: const ColorFilter.mode(
                                Colors.red, BlendMode.srcIn),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Container(
                            height: 10.h,
                            width: .7.w,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
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
                          fontSize: 10.sp, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    "صيانة دورة التبريد",
                    style:
                        TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(
                    "السعر: 320 جنيه",
                    style:
                        TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
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
              SizedBox(height: 25.h),
              Container(
                padding: EdgeInsets.all(10.h),
                margin: EdgeInsets.all(5.h),
                height: MediaQuery.of(context).size.height * 0.60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xFFD7D7D7),
                        blurRadius: 10,
                        offset: Offset(0, 2)),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "تقييمات العملاء",
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    Text(
                      "45%",
                      style: TextStyle(fontSize: 15.sp),
                    ),
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
                              left: BorderSide(width: 1),
                              bottom: BorderSide(width: 1),
                            ),
                          ),
                          barTouchData: BarTouchData(enabled: false),
                          groupsSpace: 10,
                          alignment: BarChartAlignment.spaceAround,
                          titlesData: FlTitlesData(
                            bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                    reservedSize: 22,
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
                          barGroups: [
                            BarChartGroupData(
                              x: 1,
                              barRods: [
                                BarChartRodData(
                                  toY: 10,
                                  width: 10.w,
                                  color: AppColors.primaryColor,
                                  rodStackItems: [
                                    BarChartRodStackItem(15, 30, Colors.black)
                                  ],
                                  backDrawRodData: BackgroundBarChartRodData(
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            BarChartGroupData(
                              x: 2,
                              barRods: [
                                BarChartRodData(
                                    toY: 30,
                                    width: 10.w,
                                    color: AppColors.primaryColor),
                              ],
                            ),
                            BarChartGroupData(
                              x: 3,
                              barRods: [
                                BarChartRodData(
                                    toY: 50,
                                    width: 10.w,
                                    color: AppColors.primaryColor),
                              ],
                            ),
                            BarChartGroupData(
                              x: 4,
                              barRods: [
                                BarChartRodData(
                                    toY: 80,
                                    width: 10.w,
                                    color: AppColors.primaryColor),
                              ],
                            ),
                            BarChartGroupData(
                              x: 5,
                              barRods: [
                                BarChartRodData(
                                  toY: 55,
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
            style: TextStyle(fontSize: 10.sp),
          ),
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
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
        child: FittedBox(
          child: Text(
            text,
            maxLines: 2,
          ),
        ));
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
