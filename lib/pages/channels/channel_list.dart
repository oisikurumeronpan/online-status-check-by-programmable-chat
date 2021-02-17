import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:programmable_chat_sample/models/models.dart';
import 'package:programmable_chat_sample/pages/pages.dart';
import 'package:twilio_programmable_chat/twilio_programmable_chat.dart';

class ChannelList extends HookWidget {
  const ChannelList({Key key, this.identity}) : super(key: key);

  final String identity;

  @override
  Widget build(BuildContext context) {
    final client = useProvider(chatProvider(identity).state).client;
    final controller = useProvider(chatProvider(identity));

    if (client == null) {
      return Container();
    }

    return Column(
      children: client.channels.subscribedChannels
          .map(
            (channel) => ChannelListTile(
              channel: channel,
              onTap: () {
                Navigator.of(context).push<dynamic>(
                  MaterialPageRoute<dynamic>(
                    builder: (context) => ChannelPage(
                      channel: channel,
                    ),
                  ),
                );
              },
            ),
          )
          .toList(),
    );
  }
}

class ChannelListTile extends StatelessWidget {
  const ChannelListTile({
    Key key,
    this.channel,
    this.onTap,
  }) : super(key: key);

  final Channel channel;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          title: Text(channel.sid),
          subtitle: Text(channel.status.toString()),
        ),
      ),
    );
  }
}
