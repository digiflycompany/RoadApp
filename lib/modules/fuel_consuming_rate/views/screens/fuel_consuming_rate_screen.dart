import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/modules/fuel_consuming_rate/views/widgets/add_fuel_component.dart';
import 'package:roadapp2/modules/fuel_consuming_rate/views/widgets/fuel_consumin_item.dart';
import 'package:roadapp2/modules/fuel_consuming_rate/views/widgets/single_add_fuel_text_field.dart';
import 'package:roadapp2/modules/maintenance%20_report/cubit/cubit.dart';
import 'package:roadapp2/modules/maintenance%20_report/cubit/states.dart';
import 'package:roadapp2/shared/resources/colors.dart';
import 'package:roadapp2/shared/widgets/custom_alert_dialog.dart';
import 'package:roadapp2/shared/widgets/custom_appbar.dart';
import 'package:roadapp2/shared/widgets/custom_button.dart';

class FuelConsumingRateScreen extends StatefulWidget {
  const FuelConsumingRateScreen({super.key});

  @override
  State<FuelConsumingRateScreen> createState() => _FuelConsumingRateScreenState();
}

class _FuelConsumingRateScreenState extends State<FuelConsumingRateScreen> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MaintenanceReportCubit(),
      child: BlocConsumer<MaintenanceReportCubit, MaintenanceReportStates>(
        listener: (BuildContext context, MaintenanceReportStates state) {},
        builder: (BuildContext context, MaintenanceReportStates state) {
          var cubit = MaintenanceReportCubit.get(context);
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: preferredSize,
              child: const CustomAppBar(text: 'حساب متوسط الوقود'),
            ),
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
                            onPressed: () {
                              showCustomAlertDialog(
                                context: context,
                                title: 'حساب متوسط الوقود',
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10.h,),
                                    const AddFuelComponent(firstText: 'العداد قبل اضافة الوقود', secondText: 'عدد الكيلوهات',required: false,),
                                    SizedBox(height: 5.h,),
                                    const AddFuelComponent(firstText: 'عدد الكيلوهات / جم', secondText: 'عدد الكيلوهات / لتر',required: false,),
                                    SizedBox(height: 5.h,),
                                    const AddFuelComponent(firstText: 'عدد اللترات', secondText: 'سعر اللتر',required: false,),
                                    SizedBox(height: 5.h,),
                                    const SingleAddFuelTextField(),
                                    Center(
                                      child: CustomElevatedButton(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        widget: Text('   أضف   ',style: TextStyle(fontSize: 10.sp)),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (item, index) {
                        return const FuelConsumingItem();
                      },
                      separatorBuilder: (item, index) {
                        return SizedBox(height: 20.h);
                      },
                      itemCount: 3,
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(EvaIcons.options2Outline),
                          constraints: const BoxConstraints(),
                          onPressed: () {
                            showCustomAlertDialog(
                              context: context,
                              title: "الظهور حسب",
                              content: StatefulBuilder(
                                builder: (ctxx, setState) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: 150.h,
                                        child: GridView.count(
                                          padding: EdgeInsets.zero,
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 10.0,
                                          mainAxisSpacing: 10.0,
                                          childAspectRatio: 4,
                                          children: [
                                            _buildRadioTile('شهر', setState),
                                            _buildRadioTile('3 شهور', setState),
                                            _buildRadioTile('6 شهور', setState),
                                            _buildRadioTile('9 شهور', setState),
                                            _buildRadioTile('سنة', setState),
                                          ],
                                        ),
                                      ),
                                      CustomElevatedButton(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        widget: Text(
                                          'اختر',
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            );
                          },
                        ),
                        const Spacer(),
                        Text("عدد اللترات", style: TextStyle(fontSize: 10.sp)),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("تاريخ التفويبة", style: TextStyle(fontSize: 10.sp)),
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
                                      getTitlesWidget: bottomTitleWidgets,
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
                                  BarChartGroupData(
                                    x: 2,
                                    barRods: [
                                      BarChartRodData(
                                        toY: 15,
                                        width: 10.w,
                                        color: Colors.amber,
                                      ),
                                    ],
                                  ),
                                  BarChartGroupData(
                                    x: 3,
                                    barRods: [
                                      BarChartRodData(
                                        toY: 25,
                                        width: 10.w,
                                        color: Colors.amber,
                                      ),
                                    ],
                                  ),
                                  BarChartGroupData(
                                    x: 4,
                                    barRods: [
                                      BarChartRodData(
                                        toY: 35,
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
                        ),
                      ],
                    ),
                    SizedBox(height: 25.h),
                    Container(
                      color: AppColors.whiteColor2,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text(
                                        "اجمالي كيلومترات:",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text(
                                        "استهلاك اللترات:",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            const Row(
                              children: [
                                Text(
                                  "اجمالي التكلفة:",
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
          );
        },
      ),
    );
  }

  Widget _buildRadioTile(String value, StateSetter setState) {
    return RadioListTile<String>(
      title: Text(
        value,
        style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600),
      ),
      value: value,
      contentPadding: EdgeInsets.zero,
      groupValue: _selectedOption,
      onChanged: (newValue) {
        setState(() {
          _selectedOption = newValue;
        });
      },
    );
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
      space: 7,
      child: FittedBox(child: Text(text, maxLines: 2)),
    );
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
