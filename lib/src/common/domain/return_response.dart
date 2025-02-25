// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_response.freezed.dart';

@freezed
sealed class ReturnResponse with _$ReturnResponse {
  const factory ReturnResponse({
    required AppStatusCode statusCode,
    required String message,
  }) = _ReturnResponse;

  const ReturnResponse._();
}

enum AppStatusCode {
  success,
  error;
}