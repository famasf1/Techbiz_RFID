import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed 
sealed class UserData with _$UserData {
  const factory UserData({
    required String username,
    required String passwordHash,
  }) = _UserData;

  const UserData._();

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
}