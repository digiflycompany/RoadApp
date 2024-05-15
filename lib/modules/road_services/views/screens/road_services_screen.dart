import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/modules/road_services/views/widgets/road_services_container.dart';
import 'package:roadapp2/shared/const/app_images.dart';
import 'package:roadapp2/shared/widgets/custom_appbar.dart';

class RoadServicesScreen extends StatelessWidget {
  const RoadServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child: const CustomAppBar(text: 'خدمات الطريق')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: const SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RoadServicesContainer(title: 'أقرب محطة وقود',icon: AppImages.gasIcon,),
                RoadServicesContainer(title: 'مطاعم وكافيهات',icon: AppImages.restaurantIcon,),
                RoadServicesContainer(title: 'أقرب اسعاف طبي',icon: AppImages.hospitalIcon,),
                RoadServicesContainer(title: 'اصلاح على الطريق',icon: AppImages.fixingIcon,),
                RoadServicesContainer(title: 'أوناش انقاذ',icon: AppImages.rescueIcon,),
                RoadServicesContainer(title: 'نقل بين المدن',icon: AppImages.transportIcon,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
