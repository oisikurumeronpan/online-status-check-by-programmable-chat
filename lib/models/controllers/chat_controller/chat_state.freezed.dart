// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ChatStateTearOff {
  const _$ChatStateTearOff();

// ignore: unused_element
  _ChatState call({@nullable ChatClient client}) {
    return _ChatState(
      client: client,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ChatState = _$ChatStateTearOff();

/// @nodoc
mixin _$ChatState {
  @nullable
  ChatClient get client;

  @JsonKey(ignore: true)
  $ChatStateCopyWith<ChatState> get copyWith;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res>;
  $Res call({@nullable ChatClient client});
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res> implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  final ChatState _value;
  // ignore: unused_field
  final $Res Function(ChatState) _then;

  @override
  $Res call({
    Object client = freezed,
  }) {
    return _then(_value.copyWith(
      client: client == freezed ? _value.client : client as ChatClient,
    ));
  }
}

/// @nodoc
abstract class _$ChatStateCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory _$ChatStateCopyWith(
          _ChatState value, $Res Function(_ChatState) then) =
      __$ChatStateCopyWithImpl<$Res>;
  @override
  $Res call({@nullable ChatClient client});
}

/// @nodoc
class __$ChatStateCopyWithImpl<$Res> extends _$ChatStateCopyWithImpl<$Res>
    implements _$ChatStateCopyWith<$Res> {
  __$ChatStateCopyWithImpl(_ChatState _value, $Res Function(_ChatState) _then)
      : super(_value, (v) => _then(v as _ChatState));

  @override
  _ChatState get _value => super._value as _ChatState;

  @override
  $Res call({
    Object client = freezed,
  }) {
    return _then(_ChatState(
      client: client == freezed ? _value.client : client as ChatClient,
    ));
  }
}

/// @nodoc
class _$_ChatState implements _ChatState {
  const _$_ChatState({@nullable this.client});

  @override
  @nullable
  final ChatClient client;

  @override
  String toString() {
    return 'ChatState(client: $client)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChatState &&
            (identical(other.client, client) ||
                const DeepCollectionEquality().equals(other.client, client)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(client);

  @JsonKey(ignore: true)
  @override
  _$ChatStateCopyWith<_ChatState> get copyWith =>
      __$ChatStateCopyWithImpl<_ChatState>(this, _$identity);
}

abstract class _ChatState implements ChatState {
  const factory _ChatState({@nullable ChatClient client}) = _$_ChatState;

  @override
  @nullable
  ChatClient get client;
  @override
  @JsonKey(ignore: true)
  _$ChatStateCopyWith<_ChatState> get copyWith;
}
