import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:roadapp/modules/message%20details/message_details_screen.dart';
import 'package:roadapp/shared/const/app_images.dart';
import 'package:roadapp/shared/functions/general_functions.dart';

import '../../services/navigation/navigation.dart';
import '../../shared/resources/colors.dart';

class MessagesScreen extends StatelessWidget {
  MessagesScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 14.w, right: 14.w, top: 25.h),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 45.r,
                      child: Image.asset(
                        AppImages.person2,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 25.w),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.greyColor2.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: TextFormField(
                      onTapOutside: (v) => GeneralFunctions.hideKeyboard(),
                      controller: searchController,
                      onTap:
                          GeneralFunctions.unFocusCursorRTL(searchController),
                      cursorColor: AppColors.secondColor,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        hintText: "بحث",
                        hintStyle:
                            TextStyle(fontSize: 12.sp, color: Colors.grey),
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 25.sp,
                        ),
                      ),
                      cursorWidth: 1,
                    ),
                  ),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
              ],
            ),
            SizedBox(height: 46.h),
            senderContact(
                AppImages.person3,
                "مركز الوكيل",
                "لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدموليس المحتوى) ويُستخدموليس المحتوى) ويُستخدموليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس",
                context),
            SizedBox(height: 23.h),
            senderContact(
                AppImages.person4,
                "مركز السلامة",
                "لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس",
                context),
            SizedBox(height: 23.h),
            senderContact(
                AppImages.person5, "مركز العالمية", "ارسل لك صورة", context)
          ],
        ),
      ),
    );
  }
}

Widget senderContact(String image, String title, String details, context) {
  return InkWell(
    onTap: () => AppNavigation.navigate(const MessageDetailsScreen()),
    child: Slidable(
      endActionPane: ActionPane(motion: const BehindMotion(), children: [
        SlidableAction(
            backgroundColor: AppColors.secondColor,
            icon: Icons.delete,
            onPressed: (context) {}),
        SlidableAction(
            backgroundColor: AppColors.secondColor,
            icon: Icons.volume_off,
            onPressed: (context) {}),
        SlidableAction(
            backgroundColor: AppColors.secondColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
            icon: Icons.push_pin,
            onPressed: (context) {})
      ]),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22.r,
            child: Image.asset(
              image,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                ),
                Text(
                  details,
                  maxLines: 1,
                  style: TextStyle(fontSize: 8.sp),
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: 10,
            backgroundColor: Colors.greenAccent,
            child: Text(
              '1',
              style: TextStyle(color: Colors.white, fontSize: 10.sp),
            ),
          )
        ],
      ),
    ),
  );
}
