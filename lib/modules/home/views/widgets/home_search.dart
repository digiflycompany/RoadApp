import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/modules/home/cubit/home_cubit.dart';
import 'package:roadapp2/modules/home/cubit/home_states.dart';
import 'package:roadapp2/shared/resources/colors.dart';
import 'package:roadapp2/shared/widgets/custom_alert_dialog.dart';
import 'package:roadapp2/shared/widgets/custom_button.dart';
import 'package:roadapp2/shared/widgets/custom_text_field.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, state) {
        var cubit = HomeCubit.get(context);
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.w),
              child: SizedBox(
                height: 48.h,
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    CustomTextField(
                        hintText: 'عن ماذا تبحث؟',
                        controller: cubit.searchController,
                        prefixIcon: const Icon(Icons.search_sharp,
                            color: AppColors.greyColor)),
                    Container(
                      width: 50.w,
                      decoration: BoxDecoration(
                        color: AppColors.secondColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            bottomLeft: Radius.circular(10.r)),
                      ),
                      child: IconButton(
                          color: AppColors.tertiary,
                          iconSize: 23.r,
                          onPressed: () {
                            showCustomAlertDialog(
                                context: context,
                                title: "اختر القطاع",
                                content:
                                StatefulBuilder(builder: (ctxx, setState) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Flexible(
                                            child: CheckboxListTile(
                                                title: Text(
                                                  'قطاع',
                                                  style:
                                                  TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w600),
                                                ),
                                                controlAffinity:
                                                ListTileControlAffinity
                                                    .leading,
                                                checkColor: Colors.black,
                                                fillColor:
                                                const MaterialStatePropertyAll(
                                                    AppColors.whiteColor),
                                                contentPadding: EdgeInsets.zero,
                                                value: cubit.checkBoxService,
                                                onChanged: (val) {
                                                  cubit.checkBoxService = val!;
                                                  setState(() {});
                                                }),
                                          ),
                                          Flexible(
                                            child: CheckboxListTile(
                                                title: Text(
                                                  'قطاع',
                                                  style:
                                                  TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w600),
                                                ),
                                                controlAffinity:
                                                ListTileControlAffinity
                                                    .leading,
                                                checkColor: Colors.black,
                                                fillColor:
                                                const MaterialStatePropertyAll(
                                                    AppColors.whiteColor),
                                                contentPadding: EdgeInsets.zero,
                                                value: cubit.checkBoxService2,
                                                onChanged: (val) {
                                                  cubit.checkBoxService2 = val!;
                                                  setState(() {});
                                                }),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Flexible(
                                            child: CheckboxListTile(
                                                title: Text(
                                                  'قطاع',
                                                  style:
                                                  TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w600),
                                                ),
                                                controlAffinity:
                                                ListTileControlAffinity
                                                    .leading,
                                                checkColor: Colors.black,
                                                fillColor:
                                                const MaterialStatePropertyAll(
                                                    AppColors.whiteColor),
                                                contentPadding: EdgeInsets.zero,
                                                value: cubit.checkBoxService3,
                                                onChanged: (val) {
                                                  cubit.checkBoxService3 = val!;
                                                  setState(() {});
                                                }),
                                          ),
                                          Flexible(
                                            child: CheckboxListTile(
                                                title: Text(
                                                  'قطاع',
                                                  style:
                                                  TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w600),
                                                ),
                                                controlAffinity:
                                                ListTileControlAffinity
                                                    .leading,
                                                checkColor: Colors.black,
                                                fillColor:
                                                const MaterialStatePropertyAll(
                                                    AppColors.whiteColor),
                                                contentPadding: EdgeInsets.zero,
                                                value: cubit.checkBoxService4,
                                                onChanged: (val) {
                                                  cubit.checkBoxService4 = val!;
                                                  setState(() {});
                                                }),
                                          ),
                                        ],
                                      ),
                                      Flexible(
                                        child: CheckboxListTile(
                                            title: Text(
                                              'قطاع',
                                              style:
                                              TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w600),
                                            ),
                                            controlAffinity:
                                            ListTileControlAffinity
                                                .leading,
                                            checkColor: Colors.black,
                                            fillColor:
                                            const MaterialStatePropertyAll(
                                                AppColors.whiteColor),
                                            contentPadding: EdgeInsets.zero,
                                            value: cubit.checkBoxService5,
                                            onChanged: (val) {
                                              cubit.checkBoxService5 = val!;
                                              setState(() {});
                                            }),
                                      ),
                                      CustomElevatedButton(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          widget: Text(
                                            'اختر',
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w600
                                            ),
                                          ))
                                    ],
                                  );
                                }));
                          },
                          padding: EdgeInsets.zero,
                          icon: const Icon(EvaIcons.options2Outline)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
