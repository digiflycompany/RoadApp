import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/functions/general_functions.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/accessories/views/widgets/accessories_item.dart';

class AccessoriesScreen extends StatelessWidget {
  const AccessoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: preferredSize,
            child: const CustomAppBar(text: 'الاكسسوارات')),
        body: Padding(
            padding: EdgeInsets.all(20.r),
            child: SingleChildScrollView(
                child: Column(children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.greyColor2.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10.r)),
                child: TextField(
                  onTapOutside: (v) => GeneralFunctions.hideKeyboard(),
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    hintText: "بحث",
                    hintStyle: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFFAAAAAA).withOpacity(0.5)),
                    border: InputBorder.none,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 150.h,
                    crossAxisCount: 3,
                    mainAxisSpacing: 20.h,
                  ),
                  itemBuilder: (context, index) {
                    return const Padding(
                        padding: EdgeInsets.all(8.0), child: AccessoriesItem());
                  },
                  itemCount: 9)
            ]))));
  }
}
