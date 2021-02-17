import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:twilio_programmable_chat/twilio_programmable_chat.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String identity = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    identity = value;
                  });
                },
              ),
              FlatButton(
                child: Text('login'),
                onPressed: identity.isEmpty
                    ? null
                    : () {
                        Navigator.of(context).push<dynamic>(
                          MaterialPageRoute<dynamic>(
                            builder: (context) {
                              return TestPage(
                                identity: identity,
                              );
                            },
                          ),
                        );
                      },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TestPage extends StatefulWidget {
  const TestPage({
    Key key,
    this.identity,
  }) : super(key: key);

  final String identity;

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  Future<void> _init() async {
    final token = await _getToken(widget.identity);
    await TwilioProgrammableChat.debug(dart: true, native: true, sdk: false);
    await TwilioProgrammableChat.create(token, Properties());
  }

  Future<String> _getToken(String identity) async {
    final body = json.encode({
      'identity': identity,
    });

    final response = await http.post(
      const String.fromEnvironment("API_ENDPOINT"),
      body: body,
      headers: {'Content-Type': 'application/json'},
    );

    print(response.body);

    if (response.statusCode != 200) {
      throw Exception(response.body);
    }

    return json.decode(response.body)['token'];
  }

  @override
  void initState() {
    super.initState();

    _init();
  }

  @override
  void dispose() {
    super.dispose();

    TwilioProgrammableChat.chatClient.shutdown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('test page'),
      ),
    );
  }
}
