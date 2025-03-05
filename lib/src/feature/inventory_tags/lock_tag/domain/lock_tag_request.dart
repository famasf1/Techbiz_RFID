import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:techbiz_rfid/src/common/const/app_const.dart';

part 'lock_tag_request.freezed.dart';
part 'lock_tag_request.g.dart';

@freezed 
sealed class LockTagRequest with _$LockTagRequest {
  const factory LockTagRequest({
    @Default("") String epcTag,
    @Default(AppConfig.defaultAccessPassword) String setPassword,
    @Default(null) LockType? lockType,
    @Default(null) LockObject? lockObj,
  }) = _LockTagRequest;

  const LockTagRequest._();

  factory LockTagRequest.fromJson(Map<String, dynamic> json) => _$LockTagRequestFromJson(json);
}

enum LockType {
  UNLOCK(type: 0),
  LOCK(type: 1),
  PERM_LOCK(type: 2);

  final int type;

  const LockType({required this.type});
}

enum LockObject {
  ACCESS_PWD(type: 0),
  KILL_PWD(type: 1),
  EPC_BANK(type: 2),
  TID_BANK(type: 3),
  USER_BANK(type: 4);

  final int type;

  const LockObject({required this.type});
}