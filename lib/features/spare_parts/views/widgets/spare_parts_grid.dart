import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/spare_parts/views/widgets/spare_parts_item.dart';
import 'package:roadapp/features/spare_parts_centers/presentation/manager/spare_parts_cubit.dart';
import 'package:roadapp/features/spare_parts_centers/presentation/manager/spare_parts_state.dart';

import '../../../../core/helpers/navigation/navigation.dart';
import '../../../spare_parts_centers/presentation/views/screens/spare_parts_centers_screen.dart';
import '../../cubit/spare_parts_type_cubit.dart';

class SparePartsGrid extends StatelessWidget {
  const SparePartsGrid(
      {super.key,
      required this.cubit,
      this.sparePartsTypeList,
      required this.scrollController});

  final SparePartsTypeCubit cubit;

  final dynamic sparePartsTypeList;

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 150.h,
        crossAxisCount: 3,
        mainAxisSpacing: 20.h,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<SparePartsCubit, SparePartsState>(
            builder: (context, state) {
              var cubit = SparePartsCubit.get(context);

              return GestureDetector(
                onTap: () {
                  cubit.getSparePartsCenter(typeId: sparePartsTypeList[index].id,);
                  AppNavigation.navigate(
                     SparePartsCenters(
                      typeId: sparePartsTypeList[index].id,
                    ),
                  );

                },
                child: SparePartsItem(
                  title: sparePartsTypeList[index].name,
                ),
              );
            },
          ),
        );
      },
      itemCount: sparePartsTypeList.length,
    );
  }
}
