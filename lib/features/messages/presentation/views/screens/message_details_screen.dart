import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/Localization/app_localization.dart';
import 'package:roadapp/core/utils/string_manager.dart';
import 'package:roadapp/core/widgets/custom_appbar.dart';
import 'package:roadapp/features/messages/presentation/manager/chat_cubit.dart';
import 'package:roadapp/features/messages/presentation/manager/chat_state.dart';
import 'package:roadapp/features/messages/presentation/views/widgets/chat_messages_list.dart';
import 'package:roadapp/features/messages/presentation/views/widgets/destination_info.dart';
import 'package:roadapp/features/messages/presentation/views/widgets/emojis_widget.dart';
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
                    const DestinationInfo(),
                    const ChatMessagesList(),
                    const SendTextField(),
                    if (state is ShowEmojiState) const EmojisWidget()
                  ]))));
    });
  }
}