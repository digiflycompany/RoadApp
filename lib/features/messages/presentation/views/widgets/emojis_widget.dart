import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:roadapp/features/messages/presentation/manager/chat_cubit.dart';

class EmojisWidget extends StatelessWidget {
  const EmojisWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = ChatCubit.get(context);
    return SizedBox(
        height: MediaQuery.of(context).size.height * .35,
        // child: EmojiPicker(
        //     onBackspacePressed: () {},
        //     textEditingController: cubit.messageController,
        //     config: Config(
        //         bgColor: const Color.fromARGB(255, 234, 248, 255),
        //         columns: 8,
        //         emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0)))
       );
    }
}