import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_tag_response_data.freezed.dart';
part 'edit_tag_response_data.g.dart';

@freezed
sealed class EditTagResponseData with _$EditTagResponseData {
  const factory EditTagResponseData({
    @Default("") String tagId,
  }) = _EditTagResponseData;

  const EditTagResponseData._();

  factory EditTagResponseData.fromJson(Map<String, dynamic> json) =>
      _$EditTagResponseDataFromJson(json);
}
