import 'package:flutter/material.dart';
import 'package:twilio_programmable_chat/twilio_programmable_chat.dart';

class MessageList extends StatelessWidget {
  const MessageList({Key key, this.channel}) : super(key: key);

  final Channel channel;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Message>(
      initialData: null,
      stream: channel.onMessageAdded,
      builder: (context, snap) {
        if (snap.data == null) {
          return Container();
        }
        print(snap.data.messageBody);
        return Text(snap.data.messageBody);
      },
    );
  }
}
