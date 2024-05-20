import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/modules/road_services/views/widgets/gas_station_container.dart';
import 'package:roadapp2/shared/widgets/custom_appbar.dart';

class GasStationsScreen extends StatelessWidget {
  const  GasStationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: preferredSize,
          child: const CustomAppBar(text: 'أقرب محطة وقود')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: const SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GasStationContainer(),
                GasStationContainer(),
                GasStationContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
