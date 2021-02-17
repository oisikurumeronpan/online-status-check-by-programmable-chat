import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:twilio_programmable_chat/twilio_programmable_chat.dart';

class OnlineStatusChangeEvent {
  const OnlineStatusChangeEvent(this.status);

  final bool status;
}

class OnlineStatusCheckService {
  OnlineStatusCheckService({@required this.uid}) {
    () async {
      await _init();
    }();
  }

  final String uid;

  ChatClient get client => TwilioProgrammableChat.chatClient;

  Timer _listenTimer;

  bool _prevStatus;

  final StreamController<OnlineStatusChangeEvent> _onChangeOnlineStatus =
      StreamController<OnlineStatusChangeEvent>.broadcast();

  Stream<OnlineStatusChangeEvent> onChangeOnlineStatus;

  Future<void> _init() async {
    final token = await _getToken();
    await _createClient(token);
  }

  Future<String> _getToken() async {
    final body = json.encode({
      'identity': this.uid,
    });

    final response = await http.post(
      'https://glaucous-goldfinch-8104.twil.io/chat-token',
      body: body,
      headers: {'Content-Type': 'application/json'},
    );

    print(response.body);

    if (response.statusCode != 200) {
      throw Exception(response.body);
    }

    return json.decode(response.body)['token'];
  }

  Future<void> _createClient(String token) async {
    TwilioProgrammableChat.debug(dart: true, native: true, sdk: true);
    if (TwilioProgrammableChat.chatClient != null) {
      await TwilioProgrammableChat.chatClient.updateToken(token);
    }
    await TwilioProgrammableChat.create(token, Properties());
  }

  Stream<OnlineStatusChangeEvent> listenOnlineStatusOfUid(
    String uid, {
    Duration duration,
  }) {
    _listenTimer = Timer.periodic(
      duration ?? const Duration(seconds: 2),
      (timer) async {
        final status = await checkOnlineStatusOfUid(uid);
        if (_prevStatus != status) {
          if (!_onChangeOnlineStatus.isClosed &&
              !_onChangeOnlineStatus.isPaused) {
            _onChangeOnlineStatus.add(OnlineStatusChangeEvent(status));
            _prevStatus = status;
          }
        }
      },
    );

    return _onChangeOnlineStatus.stream;
  }

  Future<bool> checkOnlineStatusOfUid(String uid) async {
    final userDescriptor = await client?.users?.getUserDescriptor(uid);

    if (userDescriptor == null) {
      return null;
    }

    return userDescriptor?.isOnline ?? false;
  }

  void cancelListenOnlineStatus() {
    _listenTimer?.cancel();
    _prevStatus = null;
  }

  Future<void> dispose() async {
    print('start dispose');
    cancelListenOnlineStatus();
    await _onChangeOnlineStatus.close();
    await client?.shutdown();
    print('end dispose');
  }
}
