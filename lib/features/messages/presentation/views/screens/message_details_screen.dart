import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/core/utils/app_assets.dart';
import 'package:roadapp/features/messages/presentation/manager/chat_cubit.dart';
import 'package:roadapp/features/messages/presentation/manager/chat_state.dart';
import 'package:roadapp/features/messages/presentation/views/widgets/emojis_widget.dart';
import 'package:roadapp/features/messages/presentation/views/widgets/message.dart';
import 'package:roadapp/features/messages/presentation/views/widgets/send_text_field.dart';

class MessageDetailsScreen extends StatelessWidget {
  const MessageDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = ChatCubit.get(context);
    return BlocBuilder<ChatCubit, ChatState>(builder: (context, state) {
      return WillPopScope(
          onWillPop: cubit.onWillPop(),
          child: Scaffold(
              appBar: PreferredSize(
                  preferredSize: preferredSize,
                  child: CustomAppBar(
                      text: StringManager.chatDetails.tr(context))),
              body: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(children: [
                    Row(children: [
                      CircleAvatar(
                          radius: 35.r, child: Image.asset(AppAssets.person4)),
                      SizedBox(width: 10.w),
                      Column(children: [
                        const Text("مركز الوكيل",
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        Text("نشط منذ 10 دقائق",
                            style: TextStyle(fontSize: 8.sp))
                      ]),
                      const Spacer(),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.search)),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.more_vert))
                    ]),
                    Expanded(
                        child: SingleChildScrollView(
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 33.0),
                                child: Column(children: [
                                  const Message(
                                      text:
                                          "لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) و يُستخدم في",
                                      received: false),
                                  SizedBox(height: 25.h),
                                  const Message(
                                      text:
                                          "لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن",
                                      received: true),
                                  SizedBox(height: 25.h),
                                  const Message(
                                      text: "لوريم إيبسوم هو", received: false),
                                  SizedBox(height: 25.h),
                                  const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [Text("اليوم")]),
                                  SizedBox(height: 25.h),
                                  const Message(
                                      text: "لوريم إيبسوم هو", received: true),
                                  SizedBox(height: 25.h),
                                  const Message(
                                      text:
                                          "لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن الغاية",
                                      received: true),
                                  SizedBox(height: 25.h),
                                  const Message(
                                      text:
                                          "لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي",
                                      received: false),
                                  SizedBox(height: 25.h),
                                  const Message(
                                      text:
                                          "لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي",
                                      received: false),
                                  SizedBox(height: 25.h),
                                  const Message(
                                      text:
                                          "لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن",
                                      received: false)
                                ])))),
                    const SendTextField(),
                    if (state is ShowEmojiState) const EmojisWidget()
                  ]))));
    });
  }
}