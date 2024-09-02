import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/road_services/views/widgets/gas_station_container.dart';

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
