// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'scanner_setting.freezed.dart';
part 'scanner_setting.g.dart';

@freezed
sealed class ScannerSetting with _$ScannerSetting {
  const factory ScannerSetting({
    @Default(0) int readPower,
    @Default(0) int writePower,
    required FrequencyArea frequencyArea,
    required String language,
  }) = _ScannerSetting;

  factory ScannerSetting.fromJson(Map<String, dynamic> json) =>
      _$ScannerSettingFromJson(json);
}

enum FrequencyArea {
  RG_NA,
  RG_NONE,
  RG_PRC,
  RG_KR,
  RG_EU,
  RG_EU2,
  RG_EU3;
}
