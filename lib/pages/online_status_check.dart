import 'package:flutter/material.dart';
import 'package:programmable_chat_sample/services/online_status_check_service.dart';

class CheckFormPage extends StatefulWidget {
  @override
  _CheckFormPageState createState() => _CheckFormPageState();
}

class _CheckFormPageState extends State<CheckFormPage> {
  String uid = '';
  String check = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                setState(() {
                  uid = value;
                });
              },
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  check = value;
                });
              },
            ),
            FlatButton(
              child: Text('check'),
              onPressed: uid.isNotEmpty && check.isNotEmpty
                  ? () {
                      Navigator.of(context).push<dynamic>(
                        MaterialPageRoute<dynamic>(
                          builder: (context) => OnlineStatusCheckingPage(
                            uid: uid,
                            check: check,
                          ),
                        ),
                      );
                    }
                  : null,
            )
          ],
        ),
      ),
    );
  }
}

class OnlineStatusCheckingPage extends StatefulWidget {
  const OnlineStatusCheckingPage({
    Key key,
    this.uid,
    this.check,
  }) : super(key: key);

  final String uid;
  final String check;

  @override
  _OnlineStatusCheckingPageState createState() =>
      _OnlineStatusCheckingPageState();
}

class _OnlineStatusCheckingPageState extends State<OnlineStatusCheckingPage> {
  OnlineStatusCheckService service;

  @override
  void initState() {
    super.initState();

    service = OnlineStatusCheckService(uid: widget.uid);
  }

  @override
  void dispose() {
    super.dispose();

    service.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<OnlineStatusChangeEvent>(
          stream: service.listenOnlineStatusOfUid(widget.check),
          builder: (context, snap) {
            return Text(snap.data?.status?.toString() ?? '');
          },
        ),
      ),
    );
  }
}
