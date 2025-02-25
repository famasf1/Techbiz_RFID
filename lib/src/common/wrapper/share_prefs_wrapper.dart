import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'share_prefs_wrapper.g.dart';

@Riverpod(keepAlive: true)
Future<SharePrefsWrapper> sharePrefsWrapper(Ref ref) async {
  final sharePrefs = await SharedPreferences.getInstance();

  return SharePrefsWrapper(sharedPrefs: sharePrefs);
}

class SharePrefsWrapper {
  final SharedPreferences sharedPrefs;
  SharePrefsWrapper({required this.sharedPrefs});

  Future<void> setString(String key, String value) async {
    final result = await sharedPrefs.setString(key, value);
    if (result == false) {
      throw Exception('Failed to set string');
    }
  }

  String? getString(String key) {
    return sharedPrefs.getString(key);
  }
}
