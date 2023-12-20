import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp2/shared/const/app_images.dart';
import 'package:roadapp2/shared/widgets/custom_appbar.dart';

import '../../shared/resources/colors.dart';



class MessageDetailsScreen extends StatelessWidget {
  const MessageDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: const CustomAppBar(text: 'تفاصيل المحادثة'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 35.r,
                  child: Image.asset(
                    AppImages.person4,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  children: [
                    const Text(
                      "مركز الوكيل",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "نشط منذ 10 دقائق",
                      style: TextStyle(fontSize: 8.sp),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 33.0),
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: 33.h,
                      // ),
                      senderMessage(
                          "لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في",
                          context),
                      SizedBox(
                        height: 25.h,
                      ),
                      receiverMessage(
                          "لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن", context),
                      SizedBox(
                        height: 25.h,
                      ),
                      senderMessage("لوريم إيبسوم هو", context),
                      SizedBox(
                        height: 25.h,
                      ),
                      const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text("اليوم")]),
                      SizedBox(
                        height: 25.h,
                      ),
                      receiverMessage("لوريم إيبسوم هو", context),
                      SizedBox(
                        height: 25.h,
                      ),
                      receiverMessage(
                          "لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن الغاية",
                          context),
                      SizedBox(
                        height: 25.h,
                      ),
                      senderMessage(
                          "لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي",
                          context),
                      SizedBox(
                        height: 25.h,
                      ),
                      senderMessage(
                          "لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي",
                          context),
                      SizedBox(
                        height: 25.h,
                      ),
                      senderMessage(
                          "لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن", context),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.secondColor,
                      borderRadius: BorderRadius.circular(50.r)
                  ),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.emoji_emotions_outlined,
                        color: AppColors.tertiary,
                      )),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.greyColor2.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: [
                        TextFormField(
                          cursorColor: AppColors.secondColor,
                          decoration: const InputDecoration(
                              isDense: true,
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              border: InputBorder.none,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.attachment,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: AppColors.secondColor,
                        borderRadius: BorderRadius.circular(50.r)
                    ),
                    child: IconButton(onPressed: () {}, icon: const Icon(Icons.send,
                      color: AppColors.tertiary,
                    ))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget senderMessage(String text, context) {
  return Align(
    alignment: Alignment.topRight,
    child: Container(
        //  alignment: Alignment.topRight,
        //   width: MediaQuery.of(context).size.width * 0.70,
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
            color: AppColors.whiteYellow,
            borderRadius: BorderRadius.circular(50.r)),
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.60),
        child: Text(
          text,
          style: TextStyle(fontSize: 12.sp),
        )),
  );
}

Widget receiverMessage(String text, context) {
  return Align(
    alignment: Alignment.topLeft,
    child: Container(
      // width: MediaQuery.of(context).size.width * 0.70,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
          color: AppColors.whiteColor2,
          borderRadius: BorderRadius.circular(50.r)),
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.60),
      child: Text(
        text,
        style: TextStyle(fontSize: 12.sp),
      ),
    ),
  );
}
