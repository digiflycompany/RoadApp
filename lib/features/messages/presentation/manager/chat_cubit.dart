import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadapp/core/utils/logger.dart';
import 'package:roadapp/features/messages/presentation/manager/chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  static ChatCubit get(context) => BlocProvider.of(context);
  bool _showEmoji = false;
  TextEditingController messageController = TextEditingController();

  Future<bool> Function() onWillPop() {
    return () async {
      if (_showEmoji) {
        _showEmoji = !_showEmoji;
        emit(HideEmojiState());
        return false;
      } else {
        return true;
      }
    };
  }

  toggleEmojis(BuildContext context) {
    DefaultLogger.logger.f('Emojis Toggled');
    _showEmoji = !_showEmoji;
    FocusScope.of(context).unfocus();
    _showEmoji? emit(ShowEmojiState()): emit(HideEmojiState());
  }

  hideEmojis() {
    if(_showEmoji) {
      _showEmoji = false;
      emit(HideEmojiState());
    }
  }
}