import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/modules/emergency_services/cubit/cubit.dart';
import 'package:roadapp/modules/emergency_services/cubit/states.dart';
import 'package:roadapp/modules/emergency_services/views/widgets/emergency_service_item.dart';
import 'package:roadapp/shared/widgets/custom_appbar.dart';

class EmergencyServicesScreen extends StatelessWidget {
  const EmergencyServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: const CustomAppBar(text: 'خدمات الطوارئ'),
      ),
      body: BlocProvider<EmergencyServicesCubit>(
        create: (BuildContext context) => EmergencyServicesCubit(),
        child: BlocConsumer<EmergencyServicesCubit, EmergencyServicesStates>(
          listener: (BuildContext context, EmergencyServicesStates state) {},
          builder: (BuildContext context, EmergencyServicesStates state) {
            var cubit = EmergencyServicesCubit.get(context);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return EmergencyServiceItem(
                        image: cubit.list[index].image,
                        title: cubit.list[index].title
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 15.h,
                    );
                  },
                  itemCount: cubit.list.length
              ),
            );
          },
        ),
      ),
    );
  }
}

