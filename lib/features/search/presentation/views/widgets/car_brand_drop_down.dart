import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/features/search/presentation/cubit/search_cubit.dart';

class CarBrandDropDown extends StatefulWidget {
  const CarBrandDropDown({super.key, required this.label, required this.hint});

  final String label, hint;

  @override
  State<CarBrandDropDown> createState() => _CarBrandDropDownState();
}

class _CarBrandDropDownState extends State<CarBrandDropDown> {

  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.position.atEdge &&
        scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
      _loadMoreData();
    }
  }

  void _loadMoreData() {
    final cubit = context.read<SearchCubit>();
      cubit.getCarBrand();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        var cubit = SearchCubit.get(context);
        var carBrandList = cubit.carBrandModel?.data.brands;

        String? selectedCarBrandName;
        if (carBrandList != null && cubit.selectedCarBrandId != null) {
          selectedCarBrandName = carBrandList
              .firstWhere(
                (brand) => brand.id == cubit.selectedCarBrandId,
            orElse: () => null!,
          )
              .name;
        }

        return SingleChildScrollView(
          controller: scrollController,
          child: Column(
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
                    selectedCarBrandName ?? widget.hint,
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: const Color(0xffAAAAAA),
                    ),
                  ),
                  items: carBrandList?.map((brand) {
                    return DropdownMenuItem<String>(
                      value: brand.id,
                      child: Text(brand.name),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      cubit.selectedCarBrandId = val;

                      debugPrint("selectedCarBrandID ===>  ${cubit.selectedCarBrandId}");
                      debugPrint("selectedCarBrandName ===>  $selectedCarBrandName");
                    });

                    // تأكد من تحديث واجهة المستخدم إذا لزم الأمر
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
