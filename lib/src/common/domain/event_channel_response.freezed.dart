// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_channel_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventChannelResponse _$EventChannelResponseFromJson(Map<String, dynamic> json) {
  return _EventChannelResponse.fromJson(json);
}

/// @nodoc
mixin _$EventChannelResponse {
  @JsonKey(name: "eventType")
  String get eventType => throw _privateConstructorUsedError;
  @JsonKey(name: 'payload')
  Object get payload => throw _privateConstructorUsedError;

  /// Serializes this EventChannelResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventChannelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventChannelResponseCopyWith<EventChannelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventChannelResponseCopyWith<$Res> {
  factory $EventChannelResponseCopyWith(EventChannelResponse value,
          $Res Function(EventChannelResponse) then) =
      _$EventChannelResponseCopyWithImpl<$Res, EventChannelResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "eventType") String eventType,
      @JsonKey(name: 'payload') Object payload});
}

/// @nodoc
class _$EventChannelResponseCopyWithImpl<$Res,
        $Val extends EventChannelResponse>
    implements $EventChannelResponseCopyWith<$Res> {
  _$EventChannelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventChannelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? payload = null,
  }) {
    return _then(_value.copyWith(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      payload: null == payload ? _value.payload : payload,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventChannelResponseImplCopyWith<$Res>
    implements $EventChannelResponseCopyWith<$Res> {
  factory _$$EventChannelResponseImplCopyWith(_$EventChannelResponseImpl value,
          $Res Function(_$EventChannelResponseImpl) then) =
      __$$EventChannelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "eventType") String eventType,
      @JsonKey(name: 'payload') Object payload});
}

/// @nodoc
class __$$EventChannelResponseImplCopyWithImpl<$Res>
    extends _$EventChannelResponseCopyWithImpl<$Res, _$EventChannelResponseImpl>
    implements _$$EventChannelResponseImplCopyWith<$Res> {
  __$$EventChannelResponseImplCopyWithImpl(_$EventChannelResponseImpl _value,
      $Res Function(_$EventChannelResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventChannelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? payload = null,
  }) {
    return _then(_$EventChannelResponseImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      payload: null == payload ? _value.payload : payload,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventChannelResponseImpl extends _EventChannelResponse {
  const _$EventChannelResponseImpl(
      {@JsonKey(name: "eventType") required this.eventType,
      @JsonKey(name: 'payload') required this.payload})
      : super._();

  factory _$EventChannelResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventChannelResponseImplFromJson(json);

  @override
  @JsonKey(name: "eventType")
  final String eventType;
  @override
  @JsonKey(name: 'payload')
  final Object payload;

  @override
  String toString() {
    return 'EventChannelResponse(eventType: $eventType, payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventChannelResponseImpl &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            const DeepCollectionEquality().equals(other.payload, payload));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, eventType, const DeepCollectionEquality().hash(payload));

  /// Create a copy of EventChannelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventChannelResponseImplCopyWith<_$EventChannelResponseImpl>
      get copyWith =>
          __$$EventChannelResponseImplCopyWithImpl<_$EventChannelResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventChannelResponseImplToJson(
      this,
    );
  }
}

abstract class _EventChannelResponse extends EventChannelResponse {
  const factory _EventChannelResponse(
          {@JsonKey(name: "eventType") required final String eventType,
          @JsonKey(name: 'payload') required final Object payload}) =
      _$EventChannelResponseImpl;
  const _EventChannelResponse._() : super._();

  factory _EventChannelResponse.fromJson(Map<String, dynamic> json) =
      _$EventChannelResponseImpl.fromJson;

  @override
  @JsonKey(name: "eventType")
  String get eventType;
  @override
  @JsonKey(name: 'payload')
  Object get payload;

  /// Create a copy of EventChannelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventChannelResponseImplCopyWith<_$EventChannelResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
