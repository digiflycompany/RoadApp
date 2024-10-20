import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/features/messages/presentation/views/widgets/message.dart';

class ChatMessagesList extends StatelessWidget {
  const ChatMessagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 33.0),
                child: Column(children: [
                  const Message(
                      text:
                          "لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) و يُستخدم في",
                      received: false),
                  SizedBox(height: 25.h),
                  const Message(
                      text: "لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن",
                      received: true),
                  SizedBox(height: 25.h),
                  const Message(text: "لوريم إيبسوم هو", received: false),
                  SizedBox(height: 25.h),
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("اليوم")]),
                  SizedBox(height: 25.h),
                  const Message(text: "لوريم إيبسوم هو", received: true),
                  SizedBox(height: 25.h),
                  const Message(
                      text: "لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن الغاية",
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
                      text: "لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن",
                      received: false)
                ]))));
  }
}