import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/calendar/presentation/views/widgets/calender_list_item.dart';

class CalenderListViewBuilder extends StatelessWidget {
  const CalenderListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (ctx, index) {
          return Row(children: [
            Column(children: [
              Text('25/09/2023', style: TextStyle(fontSize: 8.sp)),
              Text('9 ص', style: TextStyle(fontSize: 8.sp))
            ]),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Stack(alignment: Alignment.center, children: [
                  SizedBox(
                      height: index < 14 ? 100.h : 80.h,
                      child: const VerticalDivider(
                          thickness: .5, color: Colors.black26)),
                  const CircleAvatar(
                      backgroundColor: Colors.black, minRadius: 3)
                ])),
            const CalenderListItem()
          ]);
        },
        itemCount: 15,
        shrinkWrap: true);
  }
}
