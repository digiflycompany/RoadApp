import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/functions/general_functions.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_cached_network_image.dart';

class UserDataRow extends StatelessWidget {
  UserDataRow({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    String currentLang = Localizations.localeOf(context).languageCode;
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Stack(
          alignment: currentLang == 'ar'
              ? Alignment.bottomRight
              : Alignment.bottomLeft,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(height * .1),
                child: const CustomCachedNetworkImage(
                    width: 70,
                    height: 70,
                    url:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLA994hpL3PMmq0scCuWOu0LGsjef49dyXVg&s',
                    fit: BoxFit.cover)),
            Container(
                margin: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.green,
                    border: Border.all(color: AppColors.whiteColor, width: 2)),
                height: 14,
                width: 14)
          ]),
      SizedBox(width: 25.w),
      Flexible(
          child: Container(
              height: 30,
              decoration: BoxDecoration(
                  color: AppColors.greyColor2.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(10.r)),
              child: TextFormField(
                  onTapOutside: (v) => GeneralFunctions.hideKeyboard(),
                  controller: searchController,
                  onTap: GeneralFunctions.unFocusCursorRTL(searchController),
                  cursorColor: AppColors.secondColor,
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      hintText: StringManager.search.tr(context),
                      hintStyle: TextStyle(fontSize: 12.sp, color: Colors.grey),
                      border: InputBorder.none,
                      prefixIcon: Icon(CupertinoIcons.search,
                          color: Colors.grey, size: 20.sp)),
                  cursorWidth: 1))),
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
    ]);
  }
}