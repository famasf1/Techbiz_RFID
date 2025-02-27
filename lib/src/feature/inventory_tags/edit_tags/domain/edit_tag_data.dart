import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_tag_data.freezed.dart';
part 'edit_tag_data.g.dart';

@freezed
sealed class EditTagData with _$EditTagData {
  const factory EditTagData({
    @Default("") String tagId,
    @Default("") String accessPassword,
  }) = _EditTagData;

  const EditTagData._();

  factory EditTagData.fromJson(Map<String, dynamic> json) => _$EditTagDataFromJson(json);
}