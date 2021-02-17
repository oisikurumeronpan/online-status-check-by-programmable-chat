import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twilio_programmable_chat/twilio_programmable_chat.dart';

part 'channel_state.freezed.dart';

@freezed
abstract class ChannelState with _$ChannelState {
  const factory ChannelState({
    @Default(<Message>[]) List<Message> messages,
  }) = _ChannelState;
}
