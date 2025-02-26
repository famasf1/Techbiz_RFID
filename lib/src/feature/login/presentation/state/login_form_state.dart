import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/src/feature/login/domain/user_login_data.dart';

part 'login_form_state.g.dart';

@riverpod 
class UserDataState extends _$UserDataState {
  @override
  UserLoginData build() {
    return UserLoginData();
  }

  FutureOr login() {
    //TODO
  }

  FutureOr logout() {
    //TODO
  }
}