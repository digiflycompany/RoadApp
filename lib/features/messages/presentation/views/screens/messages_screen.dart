import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/messages/presentation/views/widgets/my_chats_list.dart';
import 'package:roadapp/features/messages/presentation/views/widgets/user_data_row.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(left: 14.w, right: 14.w, top: 25.h),
            child: Column(children: [
              UserDataRow(),
              SizedBox(height: 46.h),
              const MyChatsList()
            ])));
  }
}