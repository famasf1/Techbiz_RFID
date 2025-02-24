import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/generated/app_localizations.dart';

part 'app_locale_extension.g.dart'; 

extension AppLocaleExtension on BuildContext {
  AppLocalizations get localization => AppLocalizations.of(this)!;
}

@riverpod 
class LanguageState extends _$LanguageState {
  @override
  String build() {
    return 'th';
  }
}