import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/features/search/presentation/cubit/search_cubit.dart';

class CarBrandDropDown extends StatefulWidget {
  const CarBrandDropDown({super.key, required this.label, required this.hint});

  final String label, hint;

  @override
  _CarBrandDropDownState createState() => _CarBrandDropDownState();
}

class _CarBrandDropDownState extends State<CarBrandDropDown> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        var cubit = SearchCubit.get(context);
        var carBrandList = cubit.carBrandModel?.data.brands;

        return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.label,
                    style: const TextStyle(fontSize: 10),
                  ),
                  const Gap(4),
                  Container(
                    height: 31.2,
                    decoration: BoxDecoration(
                      color: const Color(0xFFECECEC),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: DropdownButton<String>(
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      isExpanded: true,
                      underline: const SizedBox.shrink(),
                      hint: Text(
                        cubit.selectedCarBrandId ?? widget.hint,
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: const Color(0xffAAAAAA),
                        ),
                      ),
                      items: carBrandList?.map((country) {
                        return DropdownMenuItem<String>(
                          value: country.name,
                          child: Text(country.name),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          cubit.selectedCarBrandId = val;
                        });
                        print("Selected Brand: ${cubit.selectedCarBrandId}");
                      },
                    ),
                  ),
                ],
              );
      },
    );
  }
}
