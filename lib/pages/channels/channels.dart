import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:programmable_chat_sample/models/models.dart';
import 'package:programmable_chat_sample/pages/channels/channel_list.dart';

class ChannelsPage extends StatelessWidget {
  const ChannelsPage({Key key, this.identity}) : super(key: key);

  final String identity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ChannelList(
              identity: identity,
            ),
            CreateChannelForm(
              identity: identity,
            ),
            JoinChannelForm(
              identity: identity,
            ),
            CheckUserStateForm(
              identity: identity,
            ),
          ],
        ),
      ),
    );
  }
}

class CreateChannelForm extends StatefulHookWidget {
  const CreateChannelForm({Key key, this.identity}) : super(key: key);

  final String identity;

  @override
  _ChatNameFormState createState() => _ChatNameFormState();
}

class _ChatNameFormState extends State<CreateChannelForm> {
  String _name = '';

  @override
  Widget build(BuildContext context) {
    final controller = useProvider(
      chatProvider(widget.identity),
    );
    return Column(
      children: [
        TextFormField(
          initialValue: _name,
          onChanged: (value) {
            setState(() {
              _name = value;
            });
          },
        ),
        FlatButton(
          onPressed: _name.isNotEmpty
              ? () {
                  controller.createChannel(_name);
                }
              : null,
          child: Text('create channel'),
        ),
      ],
    );
  }
}

class JoinChannelForm extends StatefulHookWidget {
  const JoinChannelForm({Key key, this.identity}) : super(key: key);

  final String identity;
  @override
  _JoinChannelFormState createState() => _JoinChannelFormState();
}

class _JoinChannelFormState extends State<JoinChannelForm> {
  String _name = '';

  @override
  Widget build(BuildContext context) {
    final controller = useProvider(chatProvider(widget.identity));

    return Column(
      children: [
        TextFormField(
          initialValue: _name,
          onChanged: (value) {
            setState(() {
              _name = value;
            });
          },
        ),
        FlatButton(
          onPressed: _name.isNotEmpty
              ? () {
                  controller.joinChannel(_name);
                }
              : null,
          child: Text('join channel'),
        ),
      ],
    );
  }
}

class CheckUserStateForm extends StatefulHookWidget {
  const CheckUserStateForm({Key key, this.identity}) : super(key: key);

  final String identity;
  @override
  _CheckUserStateFormState createState() => _CheckUserStateFormState();
}

class _CheckUserStateFormState extends State<CheckUserStateForm> {
  String _name = '';

  @override
  Widget build(BuildContext context) {
    final controller = useProvider(chatProvider(widget.identity));

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                initialValue: _name,
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
            ),
            FlatButton(
              onPressed: _name.isNotEmpty
                  ? () {
                      controller.isUserOnline(_name);
                    }
                  : null,
              child: Text('check'),
            ),
          ],
        ),
      ],
    );
  }
}
