import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import '../data/models/clients_model.dart';

class ClientsDetailsScreen extends StatelessWidget {
  final columns = [
    "م",
    "السيارة",
    "الموديل",
    "الفتيس",
    "رقم اللوحة",
  ];
  final cells = [
    ClientsModel("1", "صني", "2014", "مانوال", "أ ب هـ 2 3 4 6", "1"),
    ClientsModel("2", "افيو", "2010", "مانوال", "ن و ص 8 6 4 9", "2"),
    ClientsModel("3", "باندينو", "2015", "اوتوماتيك", "س و ق 1 5 7 4", "1"),
  ];

  final TextEditingController company = TextEditingController();

  ClientsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child: const CustomAppBar(text: 'العملاء المعرفين')),
      body: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(right: 25.w,left: 10.w,top: 5.h,bottom: 5.h),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5)),
                  color: AppColors.primaryColor,
                ),
                child: Text("تقييمه للمركز : 87%",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700
                ),
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(4.r)
                ),
                margin: EdgeInsets.all(5.r),
                padding: EdgeInsets.all(5.r),
                child: SvgPicture.asset(
                  AppAssets.editReservationIcon,
                  height: 15.h,
                  colorFilter: const ColorFilter.mode(
                      Colors.black, BlendMode.srcIn),
                ),
              ),
              SizedBox(width: 10.w),
              SvgPicture.asset(AppAssets.shareIcon,width: 20.w,),
              SizedBox(width: 10.w),
              SvgPicture.asset(AppAssets.filterIcon,width: 20.w,),
              SizedBox(width: 16.w),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 7.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black,

                  ),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("جاد مرسي",style: TextStyle(
                        color: Colors.white,
                        fontSize: 11.sp
                      )),
                      Text("ذكر",style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.sp
                      )),
                      Text("ظابط",style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.sp
                      )),
                      Text("0123456789",style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.sp
                      )),
                      Text("3",style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.sp
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                FittedBox(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.h, bottom: 30.h),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: DataTable(
                        headingRowColor: MaterialStateProperty.all(Colors.black),
                        columnSpacing: 18.w,
                        columns: [
                          DataColumn(
                              label: Text(
                            columns[0],
                            style: const TextStyle(color: AppColors.tertiary),
                          )),
                          DataColumn(
                              label: Text(columns[1],
                                  style:
                                      const TextStyle(color: AppColors.tertiary))),
                          DataColumn(
                              label: Center(
                            child: Text(columns[2],
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: AppColors.tertiary)),
                          )),
                          DataColumn(
                              label: Center(
                            child: Text(columns[3],
                                style: const TextStyle(color: AppColors.tertiary)),
                          )),
                          DataColumn(
                              label: Text(columns[4],
                                  style:
                                      const TextStyle(color: AppColors.tertiary))),
                          const DataColumn(
                              label: Text("",
                                  style: TextStyle(color: AppColors.tertiary))),
                        ],
                        rows: cells.map(
                          ((element) {
                            return DataRow(
                              color: MaterialStateProperty.all(
                                  cells.indexOf(element) % 2 == 0
                                      ? AppColors.primaryColor.withOpacity(0.27)
                                      : Colors.transparent),
                              cells: [
                                DataCell(Text(element.no)),
                                DataCell(Text(element.company)),
                                DataCell(Text(element.car)),
                                DataCell(Text(element.carModel)),
                                DataCell(Text(element.plateNumber)),
                                const DataCell(
                                    InkWell(
                                    child: Icon(Icons.more_vert_outlined))),
                              ],
                            );
                          }),
                        ).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
