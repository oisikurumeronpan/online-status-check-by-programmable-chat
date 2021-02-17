import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:http/http.dart' as http;
import 'package:state_notifier/state_notifier.dart';
import 'package:twilio_programmable_chat/twilio_programmable_chat.dart';

import 'chat_state.dart';

export 'chat_state.dart';

final chatProvider =
    StateNotifierProvider.autoDispose.family<ChatController, String>(
  (_, identity) => ChatController(identity: identity),
);

class ChatController extends StateNotifier<ChatState> {
  ChatController({@required this.identity}) : super(const ChatState()) {
    () async {
      await _initChatClient();
    }();
  }

  final String identity;

  Future<String> _retrieveChatToken() async {
    final body = json.encode({
      'identity': identity,
    });

    final response = await http.post(
      const String.fromEnvironment('API_ENDPOINT'),
      body: body,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception(response.toString());
    }

    final data = json.decode(response.body);

    return data['token'] as String;
  }

  Future<void> _initChatClient() async {
    final token = await _retrieveChatToken();
    print(token);

    await TwilioProgrammableChat.debug(dart: true, native: true, sdk: false);
    final client = await TwilioProgrammableChat.create(token, Properties());

    state = state.copyWith(client: client);
  }

  Future<void> createChannel(String friendlyName) async {
    final channel = await state.client?.channels?.createChannel(
      friendlyName,
      ChannelType.PRIVATE,
    );

    channel.join();
  }

  Future<void> joinChannel(String channelSidOrUniqueName) async {
    final channel =
        await state.client?.channels?.getChannel(channelSidOrUniqueName);

    print('[  DEBUG  ] ${channel.status}');

    channel.join();
  }

  Future<bool> isUserOnline(String id) async {
    final user = await state.client.users.getUserDescriptor(id);
    final u = await user.subscribe();

    print(user);

    print(state.client.connectionState);

    return false;
  }

  @override
  void dispose() {
    super.dispose();
    state.client.shutdown();
  }
}
