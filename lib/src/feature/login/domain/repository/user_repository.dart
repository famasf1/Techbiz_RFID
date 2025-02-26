import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/src/feature/login/data/user_repository_impl.dart';
import 'package:techbiz_rfid/src/feature/login/domain/user_login_data.dart';

part 'user_repository.g.dart';

@riverpod 
UserRepository userRepository(Ref ref) => UserRepositoryImpl();

abstract interface class UserRepository {
  Future<UserLoginData> login(String username, String password);
}