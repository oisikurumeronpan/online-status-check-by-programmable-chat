import 'package:hooks_riverpod/all.dart';
import 'package:twilio_programmable_chat/twilio_programmable_chat.dart';

import 'channel_state.dart';

final channelProvider = Provider.family<ChannelController, Channel>(
  (_, channel) => ChannelController(channel),
);

class ChannelController extends StateNotifier<ChannelState> {
  ChannelController(this.channel) : super(const ChannelState()) {
    () {
      channel.onMessageAdded.listen(onAddMessage);
    }();
  }

  final Channel channel;

  Future<void> invite(String identity) async {
    await channel.members.inviteByIdentity(identity);
  }

  Future<void> sendMessage(String message) async {
    final options = MessageOptions()..withBody(message);
    await channel.messages.sendMessage(options);
  }

  void onAddMessage(Message message) async {
    state = state.copyWith(
      messages: [...state.messages]..add(message),
    );
  }
}
