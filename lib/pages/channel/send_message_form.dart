import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:programmable_chat_sample/models/models.dart';
import 'package:twilio_programmable_chat/twilio_programmable_chat.dart';

class SendMessageForm extends StatefulHookWidget {
  const SendMessageForm({
    Key key,
    this.channel,
  }) : super(key: key);

  final Channel channel;

  @override
  _SendMessageFormState createState() => _SendMessageFormState();
}

class _SendMessageFormState extends State<SendMessageForm> {
  final TextEditingController _messageController = TextEditingController();

  String _message = '';

  void _setMessage(String value) {
    setState(() {
      _message = value;
    });
  }

  void _clear() {
    _setMessage('');
    _messageController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    final controller = useProvider(channelProvider(widget.channel));

    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: _messageController,
            onChanged: _setMessage,
          ),
        ),
        FlatButton(
          onPressed: _message.isNotEmpty
              ? () async {
                  await controller.sendMessage(_message);
                  _clear();
                }
              : null,
          child: Text('send'),
        ),
      ],
    );
  }
}
