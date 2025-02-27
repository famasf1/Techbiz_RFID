import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_tag_request_data.freezed.dart';
part 'edit_tag_request_data.g.dart';

@freezed
sealed class EditTagRequestData with _$EditTagRequestData {
  const factory EditTagRequestData({
    @Default("") String tagId,
    @Default("00000000") String accessPassword, // 00000000 คือ Default Password
  }) = _EditTagData;

  const EditTagRequestData._();

  factory EditTagRequestData.fromJson(Map<String, dynamic> json) => _$EditTagRequestDataFromJson(json);
}