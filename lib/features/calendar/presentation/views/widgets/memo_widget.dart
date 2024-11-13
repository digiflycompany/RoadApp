import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/functions/format_date.dart';
import 'package:roadapp/core/helpers/functions/format_time.dart';
import 'package:roadapp/features/calendar/data/models/memos_response.dart';
import 'package:roadapp/features/calendar/presentation/views/widgets/calender_list_item.dart';

class MemoWidget extends StatelessWidget {
  const MemoWidget({super.key, required this.memo, required this.index});
  final Diary memo;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Column(children: [
        Text(formatDate(memo.date!), style: TextStyle(fontSize: 8.sp)),
        Text(extractTimeFromDateString(memo.date.toString(), context), style: TextStyle(fontSize: 8.sp))
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
      CalenderListItem(memo: memo)
    ]);
  }
}
