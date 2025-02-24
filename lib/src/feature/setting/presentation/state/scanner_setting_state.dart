import 'dart:ui';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/src/feature/setting/domain/scanner_setting.dart';

part 'scanner_setting_state.g.dart';

@riverpod
class ScannerSettingState extends _$ScannerSettingState {
  @override
  ScannerSetting build() {
    return ScannerSetting(
      frequencyArea: FrequencyArea.RG_NONE,
      language: 'th',
    );
  }

  updateLanguage(String language) {
    //TODO : Need to implement language change
    late Locale _locale;
    switch (language) {
      case 'Thai':
        _locale = Locale('th');
      case 'English': 
        _locale = Locale('en');
    }

    state = state.copyWith(language: language);
  }
}
