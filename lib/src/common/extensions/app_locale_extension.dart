import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/generated/app_localizations.dart';
import 'package:techbiz_rfid/src/common/const/app_const.dart';
import 'package:techbiz_rfid/src/common/wrapper/share_prefs_wrapper.dart';

part 'app_locale_extension.g.dart'; 

extension AppLocaleExtension on BuildContext {
  AppLocalizations get translation => AppLocalizations.of(this)!;
}

@Riverpod(keepAlive: true) 
class LanguageState extends _$LanguageState {
  @override
  String build() { 
    return 'th';
  }

  loadUserLanguage() {
    final sharePrefs = ref.watch(sharePrefsWrapperProvider).requireValue;

    state = sharePrefs.getString(AppConfig.userLanguage) ?? 'th';
  }

  setLanguage(String language) {
    switch (language) {
      case AppConfig.userLanguageEnValue: 
        state = 'en';
      case AppConfig.userLanguageThValue:
        state = 'th';
    }
  }
}