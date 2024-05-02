import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/modules/calender/cubit/cubit.dart';
import 'package:roadapp2/modules/calender/cubit/states.dart';
import 'package:roadapp2/modules/calender/views/widgets/calender_listview_builder.dart';
import 'package:roadapp2/shared/widgets/custom_appbar.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../shared/resources/colors.dart';
import '../../../../shared/widgets/custom_alert_dialog.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/widgets/custom_text_field.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child: const CustomAppBar(text: 'مفكرة مواعيد زمنية')),
      body: BlocProvider<CalenderCubit>(
        create: (BuildContext context) => CalenderCubit(),
        child: BlocConsumer<CalenderCubit, CalenderState>(
          listener: (BuildContext context, CalenderState state) {},
          builder: (BuildContext context, CalenderState state) {
            var cubit = CalenderCubit().get(context);
            return Padding(
              padding: EdgeInsets.all(15.sp),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "التاريخ",
                          style: TextStyle(
                              fontSize: 9.sp, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Row(
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
                                    onPressed: () {
                                      showCustomAlertDialog(
                                          context: context,
                                          title: "أضف مذكرة",
                                          content: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                CustomTextField(
                                                  fillColor:
                                                      AppColors.whiteColor2,
                                                  hintText: "الأهمية",
                                                  controller:
                                                      TextEditingController(),
                                                  prefixIcon: const Icon(
                                                      Icons.list,
                                                      color: Colors.grey),
                                                ),
                                                SizedBox(height: 10.w),
                                                CustomTextField(
                                                  fillColor:
                                                      AppColors.whiteColor2,
                                                  hintText: "مرات التذكير",
                                                  controller:
                                                      TextEditingController(),
                                                  prefixIcon: const Icon(
                                                      Icons.more_time_outlined,
                                                      color: Colors.grey),
                                                ),
                                                SizedBox(height: 10.h),
                                                CustomTextField(
                                                  fillColor:
                                                      AppColors.whiteColor2,
                                                  hintText: "الوقت",
                                                  controller:
                                                      TextEditingController(),
                                                  prefixIcon: const Icon(
                                                      Icons.access_time_rounded,
                                                      color: Colors.grey),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 10.h),
                                                  child: CustomTextField(
                                                    fillColor:
                                                        AppColors.whiteColor2,
                                                    hintText: "التصنيف",
                                                    controller:
                                                        TextEditingController(),
                                                    prefixIcon: const Icon(
                                                        Icons.list,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                                CustomTextField(
                                                  fillColor:
                                                      AppColors.whiteColor2,
                                                  hintText: "موضوع المذكرة",
                                                  controller:
                                                      TextEditingController(),
                                                  height: 150,
                                                  maxLines: 3,
                                                ),
                                                CustomElevatedButton(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    widget:
                                                        const Text('   أضف   '))
                                              ],
                                            ),
                                          ));
                                    },
                                    icon: const Icon(Icons.add))),
                            IconButton(
                              onPressed: () async {
                                showCustomAlertDialog(
                                    context: context,
                                    title: "الظهور حسب",
                                    content: StatefulBuilder(
                                        builder: (ctx, setState) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Flexible(
                                                child: CheckboxListTile(
                                                    title: Text(
                                                      'التاريخ',
                                                      style: TextStyle(
                                                          fontSize: 10.sp),
                                                    ),
                                                    controlAffinity:
                                                        ListTileControlAffinity
                                                            .leading,
                                                    checkColor: Colors.black,
                                                    fillColor:
                                                        const MaterialStatePropertyAll(
                                                            AppColors
                                                                .primaryColor),
                                                    contentPadding:
                                                        EdgeInsets.zero,
                                                    value: cubit.checkBoxDate,
                                                    onChanged: (val) {
                                                      cubit.checkBoxDate = val!;
                                                      setState(() {});
                                                    }),
                                              ),
                                              Flexible(
                                                child: CheckboxListTile(
                                                    title: Text(
                                                      'درجة الأهمية',
                                                      style: TextStyle(
                                                          fontSize: 10.sp),
                                                    ),
                                                    controlAffinity:
                                                        ListTileControlAffinity
                                                            .leading,
                                                    checkColor: Colors.black,
                                                    fillColor:
                                                        const MaterialStatePropertyAll(
                                                            AppColors
                                                                .primaryColor),
                                                    contentPadding:
                                                        EdgeInsets.zero,
                                                    value:
                                                        cubit.importanceDegree,
                                                    onChanged: (val) {
                                                      cubit.importanceDegree =
                                                          val!;
                                                      setState(() {});
                                                    }),
                                              ),
                                            ],
                                          ),
                                          Flexible(
                                            child: CheckboxListTile(
                                                title: Text(
                                                  'رقم سيارتي',
                                                  style: TextStyle(
                                                      fontSize: 10.sp),
                                                ),
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                checkColor: Colors.black,
                                                fillColor:
                                                    const MaterialStatePropertyAll(
                                                        AppColors.primaryColor),
                                                contentPadding: EdgeInsets.zero,
                                                value: cubit.myCarNumber,
                                                onChanged: (val) {
                                                  cubit.myCarNumber = val!;
                                                  setState(() {});
                                                }),
                                          ),
                                          CustomElevatedButton(
                                              onTap: () {
                                                Navigator.pop(context);
                                                showCustomAlertDialog(
                                                  context: context,
                                                  title: 'تحديد اليوم',
                                                  content: SizedBox(
                                                    width: ScreenUtil()
                                                            .screenWidth *
                                                        0.8,
                                                    height: ScreenUtil()
                                                            .screenHeight *
                                                        0.55,
                                                    child: Column(
                                                      children: [
                                                        StatefulBuilder(builder:
                                                            (ctx,
                                                                setStateBuilder) {
                                                          return TableCalendar(
                                                              headerStyle:
                                                                  const HeaderStyle(
                                                                formatButtonVisible:
                                                                    false,
                                                                titleCentered:
                                                                    true,
                                                              ),
                                                              daysOfWeekHeight:
                                                                  50,
                                                              availableGestures:
                                                                  AvailableGestures
                                                                      .all,
                                                              selectedDayPredicate:
                                                                  (day) => isSameDay(
                                                                      day,
                                                                      cubit
                                                                          .selectedDay),
                                                              calendarBuilders: CalendarBuilders(
                                                                  selectedBuilder:
                                                                      (context,
                                                                          day,
                                                                          focusedDay) {
                                                                return CircleAvatar(
                                                                  backgroundColor:
                                                                      AppColors
                                                                          .primaryColor,
                                                                  child: Text(
                                                                      '${day.day}',
                                                                      style: const TextStyle(
                                                                          color:
                                                                              Colors.black)),
                                                                );
                                                              }, disabledBuilder:
                                                                      (context,
                                                                          day,
                                                                          focusedDay) {
                                                                return Text(
                                                                    '${day.day}',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.2),
                                                                    ));
                                                              }),
                                                              // enabledDayPredicate: (DateTime? val) {
                                                              //    String date = val.toString().split(' ').first;
                                                              //    return filterDateCubit.availableDatesModel?.dates
                                                              //        ?.contains(date) ==
                                                              //        true;
                                                              // },
                                                              onDaySelected:
                                                                  (DateTime day,
                                                                      focusedDay) {
                                                                cubit.selectedDay =
                                                                    day;
                                                                cubit.selectedHour =
                                                                    null;
                                                                setStateBuilder(
                                                                    () {});
                                                              },
                                                              focusedDay: cubit
                                                                  .focusedDay!,
                                                              firstDay: DateTime
                                                                  .now(),
                                                              lastDay:
                                                                  DateTime.now()
                                                                      .add(const Duration(days: 31)));
                                                        }),
                                                        SizedBox(height: 20.h),
                                                        CustomElevatedButton(
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          widget: const Text(
                                                              '    تم التحديد  '),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                              widget: Text(
                                                'اختر',
                                                style: TextStyle(
                                                  fontSize: 9.sp,
                                                ),
                                              ))
                                        ],
                                      );
                                    }));
                              },
                              icon: const Icon(EvaIcons.options2Outline),
                              constraints: const BoxConstraints(),
                            )
                          ],
                        ),
                      ],
                    ),
                    const CalenderListViewBuilder()
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
