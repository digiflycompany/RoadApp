import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/features/calender/cubit/cubit.dart';
import 'package:roadapp/features/calender/cubit/states.dart';
import 'package:roadapp/features/calender/views/widgets/add_note_button.dart';
import 'package:roadapp/features/calender/views/widgets/calendar_custom_text_field.dart';
import 'package:roadapp/features/calender/views/widgets/calender_listview_builder.dart';
import 'package:roadapp/core/utils/app_assets.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isArabic = Localizations.localeOf(context).languageCode == 'ar';
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: CustomAppBar(text: StringManager.timelineMemo.tr(context))),
        body: BlocProvider<CalenderCubit>(
            create: (BuildContext context) => CalenderCubit(),
            child: BlocBuilder<CalenderCubit, CalenderState>(
                builder: (BuildContext context, CalenderState state) {
              var cubit = CalenderCubit().get(context);
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.sp),
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(children: [
                        Row(
                          children: [
                            Text(
                              StringManager.date.tr(context),
                              style: TextStyle(
                                  fontSize: 9.sp, fontWeight: FontWeight.bold),
                            ),
                            Gap(isArabic
                                ? (width >= 400
                                    ? 20.4
                                    : (width >= 380
                                        ? 20
                                        : (width >= 370 ? 17.w : 2.5.w)))
                                : 25.7),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: SizedBox(
                                    height: 80.h,
                                    child: const VerticalDivider(
                                        thickness: .5, color: Colors.black26))),
                            const Spacer(),
                            const AddNoteButton(),
                            IconButton(
                              onPressed: () {
                                showCustomAlertDialog(
                                    context: context,
                                    title: "الظهور حسب",
                                    content: StatefulBuilder(
                                        builder: (context, setState) {
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
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight
                                                                  .w600),
                                                    ),
                                                    controlAffinity:
                                                        ListTileControlAffinity
                                                            .leading,
                                                    checkColor:
                                                        Colors.black,
                                                    fillColor:
                                                        const MaterialStatePropertyAll(
                                                            AppColors
                                                                .whiteColor),
                                                    contentPadding:
                                                        EdgeInsets.zero,
                                                    value:
                                                        cubit.checkBoxDate,
                                                    onChanged: (val) {
                                                      cubit.checkBoxDate =
                                                          val!;
                                                      setState(() {});
                                                    }),
                                              ),
                                              Flexible(
                                                child: CheckboxListTile(
                                                    title: Text(
                                                      'درجة الأهمية',
                                                      style: TextStyle(
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight
                                                                  .w600),
                                                    ),
                                                    controlAffinity:
                                                        ListTileControlAffinity
                                                            .leading,
                                                    checkColor:
                                                        Colors.black,
                                                    fillColor:
                                                        const MaterialStatePropertyAll(
                                                            AppColors
                                                                .whiteColor),
                                                    contentPadding:
                                                        EdgeInsets.zero,
                                                    value: cubit
                                                        .importanceDegree,
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
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                checkColor: Colors.black,
                                                fillColor:
                                                    const MaterialStatePropertyAll(
                                                        AppColors
                                                            .whiteColor),
                                                contentPadding:
                                                    EdgeInsets.zero,
                                                value: cubit.myCarNumber,
                                                onChanged: (val) {
                                                  cubit.myCarNumber = val!;
                                                  setState(() {});
                                                }),
                                          ),
                                          CustomElevatedButton(
                                              onTap: () {
                                                Navigator.pop(context);
                                                cubit.showCalendarDialog(
                                                    context);
                                                // showCustomAlertDialog(
                                                //   context: context,
                                                //   title: 'تحديد اليوم',
                                                //   content: SizedBox(
                                                //     width: ScreenUtil()
                                                //         .screenWidth *
                                                //         0.8,
                                                //     height: ScreenUtil()
                                                //         .screenHeight *
                                                //         0.55,
                                                //     child: Column(
                                                //       children: [
                                                //         StatefulBuilder(builder:
                                                //             (ctx,
                                                //             setStateBuilder) {
                                                //           return TableCalendar(
                                                //               headerStyle:
                                                //               const HeaderStyle(
                                                //                 formatButtonVisible:
                                                //                 false,
                                                //                 titleCentered:
                                                //                 true,
                                                //               ),
                                                //               daysOfWeekHeight:
                                                //               50,
                                                //               availableGestures:
                                                //               AvailableGestures
                                                //                   .all,
                                                //               selectedDayPredicate:
                                                //                   (day) => isSameDay(
                                                //                   day,
                                                //                   cubit
                                                //                       .selectedDay),
                                                //               calendarBuilders: CalendarBuilders(
                                                //                   selectedBuilder:
                                                //                       (context,
                                                //                       day,
                                                //                       focusedDay) {
                                                //                     return CircleAvatar(
                                                //                       backgroundColor:
                                                //                       AppColors
                                                //                           .primaryColor,
                                                //                       child: Text(
                                                //                           '${day.day}',
                                                //                           style: const TextStyle(
                                                //                               color:
                                                //                               Colors.black)),
                                                //                     );
                                                //                   }, disabledBuilder:
                                                //                   (context,
                                                //                   day,
                                                //                   focusedDay) {
                                                //                 return Text(
                                                //                     '${day.day}',
                                                //                     style:
                                                //                     TextStyle(
                                                //                       color: Colors
                                                //                           .black
                                                //                           .withOpacity(
                                                //                           0.2),
                                                //                     ));
                                                //               }),
                                                //               // enabledDayPredicate: (DateTime? val) {
                                                //               //    String date = val.toString().split(' ').first;
                                                //               //    return filterDateCubit.availableDatesModel?.dates
                                                //               //        ?.contains(date) ==
                                                //               //        true;
                                                //               // },
                                                //               onDaySelected:
                                                //                   (DateTime day,
                                                //                   focusedDay) {
                                                //                 cubit.selectedDay =
                                                //                     day;
                                                //                 cubit.selectedHour =
                                                //                 null;
                                                //                 setStateBuilder(
                                                //                         () {});
                                                //               },
                                                //               focusedDay: cubit
                                                //                   .focusedDay!,
                                                //               firstDay: DateTime
                                                //                   .now(),
                                                //               lastDay:
                                                //               DateTime.now()
                                                //                   .add(const Duration(days: 31)));
                                                //         }),
                                                //         SizedBox(height: 20.h),
                                                //         CustomElevatedButton(
                                                //           onTap: () {
                                                //             Navigator.pop(
                                                //                 context);
                                                //           },
                                                //           widget: const Text(
                                                //               '    تم التحديد  '),
                                                //         )
                                                //       ],
                                                //     ),
                                                //   ),
                                                // );
                                              },
                                              widget: Text(
                                                'اختر',
                                                style: TextStyle(
                                                    fontSize: 10.sp,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ))
                                        ],
                                      );
                                    }));
                              },
                              icon: const Icon(EvaIcons.options2Outline),
                              constraints: const BoxConstraints(),
                            ),
                          ],
                        ),
                        const CalenderListViewBuilder()
                      ])));
            })));
  }
}
