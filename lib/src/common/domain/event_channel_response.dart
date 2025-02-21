// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_channel_response.freezed.dart';
part 'event_channel_response.g.dart';

@freezed
sealed class EventChannelResponse with _$EventChannelResponse {
  const factory EventChannelResponse({
    @JsonKey(name: "eventType") required String eventType,
    @JsonKey(name: 'payload') required Object payload,
  }) = _EventChannelResponse;

  const EventChannelResponse._();

  factory EventChannelResponse.fromJson(Map<String, dynamic> json) => _$EventChannelResponseFromJson(json);
}