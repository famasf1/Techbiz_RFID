import 'dart:ui';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/src/feature/setting/domain/scanner_setting.dart';
import 'package:techbiz_rfid/src/feature/setting/domain/service/scanner_service_service.dart';

part 'scanner_setting_state.g.dart';

@riverpod
class ScannerSettingState extends _$ScannerSettingState {
  @override
  ScannerSetting build() {
    // final scannerSettingService = ref.watch(scannerSettingServiceProvider);

    return ScannerSetting();
  }

  Future setDefaultPowerSetting() async {
    final scannerSettingService = ref.watch(scannerSettingServiceProvider);
    final powerSetting = await scannerSettingService.getPowerSetting();

    state = state.copyWith(
      readPower: powerSetting.readPower,
      writePower: powerSetting.writePower,
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

  updateReadPower(int power) {
    state = state.copyWith(readPower: power);
  }

  updateWritePower(int power) {
    state = state.copyWith(writePower: power);
  }

  updatefrequencyArea(FrequencyArea frequencyArea) {
    state = state.copyWith(frequencyArea: frequencyArea);
  }
}
