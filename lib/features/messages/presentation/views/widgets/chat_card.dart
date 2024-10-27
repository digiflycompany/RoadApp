import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:roadapp/core/Theming/colors.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/features/messages/presentation/views/screens/message_details_screen.dart';

class ChatCard extends StatelessWidget {
  const ChatCard(
      {super.key,
      required this.title,
      required this.image,
      required this.details});
  final String title, image, details;

  @override
  Widget build(BuildContext context) {
    String currentLang = Localizations.localeOf(context).languageCode;
    return InkWell(
        onTap: () => AppNavigation.navigate(const MessageDetailsScreen()),
        child: Slidable(
            closeOnScroll: true,
            endActionPane: ActionPane(
                extentRatio: .4,
                motion: const BehindMotion(),
                children: [
                  SlidableAction(
                      padding: EdgeInsets.zero,
                      backgroundColor: AppColors.secondColor,
                      icon: CupertinoIcons.delete_simple,
                      onPressed: (context) {}),
                  SlidableAction(
                      backgroundColor: AppColors.secondColor,
                      icon: CupertinoIcons.volume_off,
                      onPressed: (context) {}),
                  SlidableAction(
                      backgroundColor: AppColors.secondColor,
                      borderRadius: currentLang == 'ar'
                          ? const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))
                          : const BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                      icon: CupertinoIcons.pin,
                      onPressed: (context) {})
                ]),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  CircleAvatar(radius: 22.r, child: Image.asset(image)),
                  SizedBox(width: 10.w),
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text(title,
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.bold)),
                        Text(details,
                            maxLines: 1, style: TextStyle(fontSize: 8.sp))
                      ])),
                  CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.greenAccent,
                      child: Text('1',
                          style:
                              TextStyle(color: Colors.white, fontSize: 10.sp)))
                ]))));
  }
}