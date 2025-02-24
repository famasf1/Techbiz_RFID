// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'scanner_setting.freezed.dart';
part 'scanner_setting.g.dart';

@freezed
sealed class ScannerSetting with _$ScannerSetting {
  const factory ScannerSetting({
    @Default(0) int readPower,
    @Default(0) int writePower,
    @Default(FrequencyArea.RG_NONE) FrequencyArea frequencyArea,
    @Default('Thai') String language,
  }) = _ScannerSetting;

  factory ScannerSetting.fromJson(Map<String, dynamic> json) =>
      _$ScannerSettingFromJson(json);
}

enum FrequencyArea implements Comparable<FrequencyArea> {
  RG_NA(
    range: "902–928 MHz",
    country: "North America (USA, Canada, Mexico) FCC RFID Standard",
  ),
  RG_NONE(range: "Undefined", country: "Undefined"),
  RG_PRC(range: "920–925 MHz", country: "China"),
  RG_KR(range: "917–920.8 MHz", country: "South Korea"),
  RG_EU(range: "865–868 MHz", country: "Europe (ETSI Standard)"),
  RG_EU2(range: "915–921 MHz", country: "Additional EU frequencies (ETSI)"),
  RG_EU3(range: "916.3–918.7 MHz", country: "More extended EU frequencies");

  const FrequencyArea({
    this.range,
    this.country,
  });

  final String? range;
  final String? country;

  @override
  int compareTo(FrequencyArea other) {
    return range!.compareTo(other.range!);
  }
}
