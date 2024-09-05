import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/widgets/custom_button.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/cubit.dart';
import 'package:roadapp/features/maintenance%20_report/cubit/states.dart';
import 'package:roadapp/features/maintenance%20_report/views/widgets/add_report_icon.dart';
import 'package:roadapp/features/maintenance%20_report/views/widgets/maintenance_report_item.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/core/Theming/colors.dart';

class MaintenanceReportScreen extends StatefulWidget {
  const MaintenanceReportScreen({super.key});

  @override
  State<MaintenanceReportScreen> createState() =>
      _MaintenanceReportScreenState();
}

class _MaintenanceReportScreenState extends State<MaintenanceReportScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MaintenanceReportCubit>(
        create: (BuildContext context) => MaintenanceReportCubit(),
        child: BlocConsumer<MaintenanceReportCubit, MaintenanceReportStates>(
            listener: (BuildContext context, MaintenanceReportStates state) {},
            builder: (BuildContext context, MaintenanceReportStates state) {
              var cubit = MaintenanceReportCubit.get(context);
              return Scaffold(
                  appBar: PreferredSize(
                      preferredSize: preferredSize,
                      child: CustomAppBar(
                          text: StringManager.maintenanceReports.tr(context))),
                  body: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.0.w, vertical: 20.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      width: 230.w,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.black),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("1",
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: AppColors.tertiary)),
                                            SizedBox(width: 10.w),
                                            Text(
                                                StringManager.toyota
                                                    .tr(context),
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: AppColors.tertiary)),
                                            SizedBox(width: 10.w),
                                            Text(
                                                StringManager.corolla
                                                    .tr(context),
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: AppColors.tertiary)),
                                            SizedBox(width: 10.w),
                                            Text("2015",
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: AppColors.tertiary)),
                                            SizedBox(width: 10.w),
                                            Text(StringManager.ABH.tr(context),
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: AppColors.tertiary)),
                                            const Gap(3),
                                            Text(
                                                StringManager.licensePlate
                                                    .tr(context),
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: AppColors.tertiary))
                                          ])),
                                  const AddReportIcon(),
                                  SizedBox(
                                      width: 20.w,
                                      child: GestureDetector(
                                          onTap: () {
                                            showCustomAlertDialog(
                                                context: context,
                                                title: StringManager.share
                                                    .tr(context),
                                                content: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      SizedBox(height: 10.h),
                                                      Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  SvgPicture.asset(
                                                                      AppAssets
                                                                          .whatsappIcon),
                                                                  SizedBox(
                                                                    width: 5.w,
                                                                  ),
                                                                  Text(
                                                                      StringManager
                                                                          .whatsApp
                                                                          .tr(
                                                                              context),
                                                                      style: TextStyle(
                                                                          fontSize: 12
                                                                              .sp,
                                                                          fontWeight:
                                                                              FontWeight.w600))
                                                                ]),
                                                            Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  SvgPicture.asset(
                                                                      AppAssets
                                                                          .gmailIcon),
                                                                  SizedBox(
                                                                    width: 5.w,
                                                                  ),
                                                                  Text(
                                                                      StringManager
                                                                          .gmail
                                                                          .tr(
                                                                              context),
                                                                      style: TextStyle(
                                                                          fontSize: 12
                                                                              .sp,
                                                                          fontWeight:
                                                                              FontWeight.w600))
                                                                ])
                                                          ]),
                                                      SizedBox(height: 20.h),
                                                      Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  SvgPicture.asset(
                                                                      AppAssets
                                                                          .messagesIcon),
                                                                  SizedBox(
                                                                    width: 5.w,
                                                                  ),
                                                                  Text(
                                                                      StringManager
                                                                          .viaMessages
                                                                          .tr(
                                                                              context),
                                                                      style: TextStyle(
                                                                          fontSize: 12
                                                                              .sp,
                                                                          fontWeight:
                                                                              FontWeight.w600))
                                                                ]),
                                                            Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  SvgPicture.asset(
                                                                      AppAssets
                                                                          .downloadIcon),
                                                                  SizedBox(
                                                                      width:
                                                                          5.w),
                                                                  Text(
                                                                      StringManager
                                                                          .download
                                                                          .tr(
                                                                              context),
                                                                      style: TextStyle(
                                                                          fontSize: 12
                                                                              .sp,
                                                                          fontWeight:
                                                                              FontWeight.w600))
                                                                ])
                                                          ]),
                                                      Divider(
                                                          height: 50,
                                                          thickness: 0.5.w,
                                                          color: AppColors
                                                              .greyColor),
                                                      Text(
                                                          StringManager.format
                                                              .tr(context),
                                                          style: TextStyle(
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                      SizedBox(height: 20.h),
                                                      Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  SvgPicture.asset(
                                                                      AppAssets
                                                                          .excelIcon),
                                                                  SizedBox(
                                                                    width: 5.w,
                                                                  ),
                                                                  Text(
                                                                      StringManager
                                                                          .excel
                                                                          .tr(
                                                                              context),
                                                                      style: TextStyle(
                                                                          fontSize: 12
                                                                              .sp,
                                                                          fontWeight:
                                                                              FontWeight.w600))
                                                                ]),
                                                            Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  SvgPicture.asset(
                                                                      AppAssets
                                                                          .pdfIcon),
                                                                  SizedBox(
                                                                    width: 5.w,
                                                                  ),
                                                                  Text(
                                                                      StringManager
                                                                          .pdf
                                                                          .tr(
                                                                              context),
                                                                      style: TextStyle(
                                                                          fontSize: 12
                                                                              .sp,
                                                                          fontWeight:
                                                                              FontWeight.w600))
                                                                ])
                                                          ]),
                                                      Flexible(
                                                          child:
                                                              CheckboxListTile(
                                                                  title: Text(
                                                                      StringManager
                                                                          .sendWithPrice
                                                                          .tr(
                                                                              context),
                                                                      style: TextStyle(
                                                                          fontSize: 10
                                                                              .sp,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          color: Colors.grey[
                                                                              400])),
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .leading,
                                                                  checkColor:
                                                                      Colors
                                                                          .black,
                                                                  fillColor:
                                                                      const MaterialStatePropertyAll(
                                                                          AppColors
                                                                              .whiteColor),
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  value: cubit
                                                                      .checkBoxService,
                                                                  onChanged:
                                                                      (val) {
                                                                    cubit.selectPrice =
                                                                        val!;
                                                                    setState(
                                                                        () {});
                                                                  })),
                                                      CustomElevatedButton(
                                                          onTap: () {},
                                                          widget: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          4),
                                                              child: Text(
                                                                  StringManager
                                                                      .select
                                                                      .tr(
                                                                          context),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10.sp))))
                                                    ]));
                                          },
                                          child: SvgPicture.asset(
                                              AppAssets.shareIcon,
                                              width: 20.w))),
                                  SizedBox(
                                      width: 20.w,
                                      child: GestureDetector(
                                          onTap: () {
                                            showCustomAlertDialog(
                                                context: context,
                                                title: StringManager.filterBy
                                                    .tr(context),
                                                content: StatefulBuilder(
                                                    builder: (ctxx, setState) {
                                                  return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Flexible(
                                                                  child: CheckboxListTile(
                                                                      title: Text(StringManager.date.tr(context), style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600)),
                                                                      controlAffinity: ListTileControlAffinity.leading,
                                                                      checkColor: Colors.black,
                                                                      fillColor: const MaterialStatePropertyAll(AppColors.whiteColor),
                                                                      contentPadding: EdgeInsets.zero,
                                                                      value: cubit.checkBoxDate,
                                                                      onChanged: (val) {
                                                                        cubit.checkBoxDate =
                                                                            val!;
                                                                        setState(
                                                                            () {});
                                                                      })),
                                                              Flexible(
                                                                  child: CheckboxListTile(
                                                                      title: Text(StringManager.service.tr(context), style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600)),
                                                                      controlAffinity: ListTileControlAffinity.leading,
                                                                      checkColor: Colors.black,
                                                                      fillColor: const MaterialStatePropertyAll(AppColors.whiteColor),
                                                                      contentPadding: EdgeInsets.zero,
                                                                      value: cubit.checkBoxService,
                                                                      onChanged: (val) {
                                                                        cubit.checkBoxService =
                                                                            val!;
                                                                        setState(
                                                                            () {});
                                                                      }))
                                                            ]),
                                                        Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Flexible(
                                                                  child: CheckboxListTile(
                                                                      title: Text(StringManager.price.tr(context), style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600)),
                                                                      controlAffinity: ListTileControlAffinity.leading,
                                                                      checkColor: Colors.black,
                                                                      fillColor: const MaterialStatePropertyAll(AppColors.whiteColor),
                                                                      contentPadding: EdgeInsets.zero,
                                                                      value: cubit.checkBoxPrice,
                                                                      onChanged: (val) {
                                                                        cubit.checkBoxPrice =
                                                                            val!;
                                                                        setState(
                                                                            () {});
                                                                      })),
                                                              Flexible(
                                                                  child: CheckboxListTile(
                                                                      title: Text(StringManager.center.tr(context), style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600)),
                                                                      controlAffinity: ListTileControlAffinity.leading,
                                                                      checkColor: Colors.black,
                                                                      fillColor: const MaterialStatePropertyAll(AppColors.whiteColor),
                                                                      contentPadding: EdgeInsets.zero,
                                                                      value: cubit.checkBoxCenter,
                                                                      onChanged: (val) {
                                                                        cubit.checkBoxCenter =
                                                                            val!;
                                                                        setState(
                                                                            () {});
                                                                      }))
                                                            ]),
                                                        Flexible(
                                                            child:
                                                                CheckboxListTile(
                                                                    title: Text(
                                                                        StringManager
                                                                            .product
                                                                            .tr(
                                                                                context),
                                                                        style: TextStyle(
                                                                            fontSize: 10
                                                                                .sp,
                                                                            fontWeight: FontWeight
                                                                                .w600)),
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                    checkColor:
                                                                        Colors
                                                                            .black,
                                                                    fillColor:
                                                                        const MaterialStatePropertyAll(AppColors
                                                                            .whiteColor),
                                                                    contentPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    value: cubit
                                                                        .checkBoxProduct,
                                                                    onChanged:
                                                                        (val) {
                                                                      cubit.checkBoxProduct =
                                                                          val!;
                                                                      setState(
                                                                          () {});
                                                                    })),
                                                        CustomElevatedButton(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            widget: Text(
                                                                StringManager
                                                                    .select
                                                                    .tr(
                                                                        context),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600)))
                                                      ]);
                                                }));
                                          },
                                          child: SvgPicture.asset(
                                              AppAssets.filterIcon,
                                              width: 20.w)))
                                ]),
                            SizedBox(height: 25.h),
                            const MaintenanceReportItem(),
                            SizedBox(height: 25.h),
                            const MaintenanceReportItem()
                          ])));
            }));
  }
}
