import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twilio_programmable_chat/twilio_programmable_chat.dart';

part 'chat_state.freezed.dart';

@freezed
abstract class ChatState with _$ChatState {
  const factory ChatState({
    @nullable ChatClient client,
  }) = _ChatState;
}
