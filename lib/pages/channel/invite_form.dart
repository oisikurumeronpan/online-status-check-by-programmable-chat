import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:programmable_chat_sample/models/models.dart';
import 'package:twilio_programmable_chat/twilio_programmable_chat.dart';

class InviteForm extends StatefulHookWidget {
  const InviteForm({
    Key key,
    this.channel,
  }) : super(key: key);

  final Channel channel;

  @override
  _InviteFormState createState() => _InviteFormState();
}

class _InviteFormState extends State<InviteForm> {
  final TextEditingController _identityController = TextEditingController();

  String _identity = '';

  void _setIdentity(String value) {
    setState(() {
      _identity = value;
    });
  }

  void _clear() {
    _setIdentity('');
    _identityController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    final controller = useProvider(channelProvider(widget.channel));

    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: _identityController,
            onChanged: _setIdentity,
          ),
        ),
        FlatButton(
          onPressed: _identity.isNotEmpty
              ? () async {
                  await controller.invite(_identity);
                  _clear();
                }
              : null,
          child: Text('invite'),
        ),
      ],
    );
  }
}
