import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:programmable_chat_sample/models/models.dart';
import 'package:programmable_chat_sample/pages/channel/invite_form.dart';
import 'package:programmable_chat_sample/pages/channel/message_list.dart';
import 'package:programmable_chat_sample/pages/channel/send_message_form.dart';
import 'package:twilio_programmable_chat/twilio_programmable_chat.dart';

class ChannelPage extends HookWidget {
  const ChannelPage({Key key, this.channel}) : super(key: key);

  final Channel channel;

  @override
  Widget build(BuildContext context) {
    final controller = useProvider(channelProvider(channel));

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MessageList(
              channel: channel,
            ),
            SendMessageForm(
              channel: channel,
            ),
            InviteForm(
              channel: channel,
            ),
          ],
        ),
      ),
    );
  }
}
