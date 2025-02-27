// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:techbiz_rfid/src/common/domain/enum/app_status_code.dart';

part 'return_response.freezed.dart';
part 'return_response.g.dart';

@freezed
sealed class ReturnResponse with _$ReturnResponse {
  const factory ReturnResponse({
    // ignore: invalid_annotation_target
    @JsonKey(name: "code") @Default("200") String code,
    required AppStatusCode statusCode,
    required String message,
  }) = _ReturnResponse;

  const ReturnResponse._();

  factory ReturnResponse.fromJson(Map<String, dynamic> json) =>
      _$ReturnResponseFromJson(json);
}
