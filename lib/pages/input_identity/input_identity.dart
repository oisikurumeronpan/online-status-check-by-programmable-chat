import 'package:flutter/material.dart';
import 'package:programmable_chat_sample/pages/pages.dart';

class InputIdentityPage extends StatefulWidget {
  @override
  _InputIdentityPageState createState() => _InputIdentityPageState();
}

class _InputIdentityPageState extends State<InputIdentityPage> {
  String _identity = '';

  setIdentity(String value) {
    setState(() {
      _identity = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              initialValue: _identity,
              onChanged: setIdentity,
            ),
            FlatButton(
              onPressed: _identity.isNotEmpty
                  ? () {
                      Navigator.of(context).push<dynamic>(
                        MaterialPageRoute<dynamic>(
                          builder: (context) => ChannelsPage(
                            identity: _identity,
                          ),
                        ),
                      );
                    }
                  : null,
              child: Text('enter'),
            )
          ],
        ),
      ),
    );
  }
}
