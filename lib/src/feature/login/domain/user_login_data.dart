import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_login_data.freezed.dart';
part 'user_login_data.g.dart';

@freezed 
sealed class UserLoginData with _$UserLoginData {
  const factory UserLoginData({
    @Default('') String username,
    @Default('') String passwordHash,
  }) = _UserData;

  const UserLoginData._();

  factory UserLoginData.fromJson(Map<String, dynamic> json) => _$UserLoginDataFromJson(json);
}