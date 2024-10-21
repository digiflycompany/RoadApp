import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/features/messages/presentation/views/widgets/chat_card.dart';

class MyChatsList extends StatelessWidget {
  const MyChatsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const ChatCard(
          image: AppAssets.person3,
          title: "مركز الوكيل",
          details:
              "لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدموليس المحتوى) ويُستخدموليس المحتوى) ويُستخدموليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس"),
      SizedBox(height: 23.h),
      const ChatCard(
          image: AppAssets.person4,
          title: "مركز السلامة",
          details:
              "لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس"),
      SizedBox(height: 23.h),
      const ChatCard(
          image: AppAssets.person5,
          title: "مركز العالمية",
          details: "ارسل لك صورة")
    ]);
  }
}