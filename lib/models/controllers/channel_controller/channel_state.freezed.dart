// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'channel_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ChannelStateTearOff {
  const _$ChannelStateTearOff();

// ignore: unused_element
  _ChannelState call({List<Message> messages = const <Message>[]}) {
    return _ChannelState(
      messages: messages,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ChannelState = _$ChannelStateTearOff();

/// @nodoc
mixin _$ChannelState {
  List<Message> get messages;

  @JsonKey(ignore: true)
  $ChannelStateCopyWith<ChannelState> get copyWith;
}

/// @nodoc
abstract class $ChannelStateCopyWith<$Res> {
  factory $ChannelStateCopyWith(
          ChannelState value, $Res Function(ChannelState) then) =
      _$ChannelStateCopyWithImpl<$Res>;
  $Res call({List<Message> messages});
}

/// @nodoc
class _$ChannelStateCopyWithImpl<$Res> implements $ChannelStateCopyWith<$Res> {
  _$ChannelStateCopyWithImpl(this._value, this._then);

  final ChannelState _value;
  // ignore: unused_field
  final $Res Function(ChannelState) _then;

  @override
  $Res call({
    Object messages = freezed,
  }) {
    return _then(_value.copyWith(
      messages:
          messages == freezed ? _value.messages : messages as List<Message>,
    ));
  }
}

/// @nodoc
abstract class _$ChannelStateCopyWith<$Res>
    implements $ChannelStateCopyWith<$Res> {
  factory _$ChannelStateCopyWith(
          _ChannelState value, $Res Function(_ChannelState) then) =
      __$ChannelStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Message> messages});
}

/// @nodoc
class __$ChannelStateCopyWithImpl<$Res> extends _$ChannelStateCopyWithImpl<$Res>
    implements _$ChannelStateCopyWith<$Res> {
  __$ChannelStateCopyWithImpl(
      _ChannelState _value, $Res Function(_ChannelState) _then)
      : super(_value, (v) => _then(v as _ChannelState));

  @override
  _ChannelState get _value => super._value as _ChannelState;

  @override
  $Res call({
    Object messages = freezed,
  }) {
    return _then(_ChannelState(
      messages:
          messages == freezed ? _value.messages : messages as List<Message>,
    ));
  }
}

/// @nodoc
class _$_ChannelState implements _ChannelState {
  const _$_ChannelState({this.messages = const <Message>[]})
      : assert(messages != null);

  @JsonKey(defaultValue: const <Message>[])
  @override
  final List<Message> messages;

  @override
  String toString() {
    return 'ChannelState(messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChannelState &&
            (identical(other.messages, messages) ||
                const DeepCollectionEquality()
                    .equals(other.messages, messages)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(messages);

  @JsonKey(ignore: true)
  @override
  _$ChannelStateCopyWith<_ChannelState> get copyWith =>
      __$ChannelStateCopyWithImpl<_ChannelState>(this, _$identity);
}

abstract class _ChannelState implements ChannelState {
  const factory _ChannelState({List<Message> messages}) = _$_ChannelState;

  @override
  List<Message> get messages;
  @override
  @JsonKey(ignore: true)
  _$ChannelStateCopyWith<_ChannelState> get copyWith;
}
