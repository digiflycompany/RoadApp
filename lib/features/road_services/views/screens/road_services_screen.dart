import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/road_services/views/screens/gas_stations_screen.dart';
import 'package:roadapp/features/road_services/views/widgets/road_services_container.dart';
import 'package:roadapp/core/navigation/navigation.dart';
import 'package:roadapp/core/utils/app_assets.dart';

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
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RoadServicesContainer(title: 'أقرب محطة وقود',icon: AppAssets.gasIcon,onTap: ()=>AppNavigation.navigate(const GasStationsScreen()),),
                const RoadServicesContainer(title: 'مطاعم وكافيهات',icon: AppAssets.restaurantIcon,),
                const RoadServicesContainer(title: 'أقرب اسعاف طبي',icon: AppAssets.hospitalIcon,),
                const RoadServicesContainer(title: 'اصلاح على الطريق',icon: AppAssets.fixingIcon,),
                const RoadServicesContainer(title: 'أوناش انقاذ',icon: AppAssets.rescueIcon,),
                const RoadServicesContainer(title: 'نقل بين المدن',icon: AppAssets.transportIcon,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
