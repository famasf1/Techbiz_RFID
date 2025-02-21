import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_info.freezed.dart';
part 'tag_info.g.dart';

@freezed
sealed class TagInfo with _$TagInfo {

  const factory TagInfo({
    required int antennaId,
    required int frequency,
    required int timeStamp,
    required int embeddedDatalen,
    required List<int> embeddedData,
    required int epclen,
    required List<int> pc,
    required List<int> crc,
    required String epcId,
    required int phase,
  }) = _TagInfo;

  const TagInfo._();

  factory TagInfo.fromJson(Map<String, dynamic> json) => _$TagInfoFromJson(json);
}