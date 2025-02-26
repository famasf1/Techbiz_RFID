import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/src/feature/login/application/user_service_impl.dart';
import 'package:techbiz_rfid/src/feature/login/domain/user_login_data.dart';

part 'user_service.g.dart';

@riverpod 
UserService userService(Ref ref) => UserServiceImpl();

abstract interface class UserService {
  Future<UserLoginData> login(String username, String password);
  Future<void> logout();
}
