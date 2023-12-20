import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp2/modules/maintenance_cooling/maintenance_cooling.dart';
import 'package:roadapp2/shared/const/app_images.dart';

import '../../services/navigation/navigation.dart';
import '../../shared/resources/colors.dart';
import '../../shared/widgets/custom_appbar.dart';

class SparePartsScreen extends StatelessWidget {
  const SparePartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child: const CustomAppBar(text: 'قطع غيار')),
       body: Padding(
        padding: EdgeInsets.all(20.0.r),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.greyColor2.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10.r)),
                child: TextFormField(
                  cursorColor: AppColors.secondColor,
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding:
                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    hintText: "بحث",
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.secondColor,
                    ),
                  ),
                ),
              ),

              // GridView.count(
              //   shrinkWrap: true,
              //   scrollDirection: Axis.vertical,
              //   physics: const BouncingScrollPhysics(),
              //   crossAxisCount: 3,
              //   children: <Widget>[
              //     item(context),
              //     item(context),
              //     item(context),
              //     item(context),
              //   ],
              // )

              GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const ScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 220.h,
                    crossAxisCount: 3),
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: item(context),
                  );
                },
                itemCount:9,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget item(context) {
    return InkWell(
      onTap: () {
        AppNavigation.navigate(MaintenanceCooling());
      },
      child: Column(
        children: [
          Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20.r)),
              child: SvgPicture.asset(
                  width: 30.w,
                  height: 30.h,
                  fit: BoxFit.scaleDown,
                  AppImages.wrench)),
          SizedBox(
            height: 20.h,
          ),
          const Text("صيانة دورة التبريد"),
        ],
      ),
    );
  }
}
