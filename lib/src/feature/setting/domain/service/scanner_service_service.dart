import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/src/common/domain/return_response.dart';
import 'package:techbiz_rfid/src/common/wrapper/share_prefs_wrapper.dart';
import 'package:techbiz_rfid/src/feature/setting/application/scanner_setting_service_impl.dart';
import 'package:techbiz_rfid/src/feature/setting/domain/scanner_setting.dart';
import 'package:uhf6_plugin/uhf6_plugin.dart';

part 'scanner_service_service.g.dart';

@riverpod
ScannerSettingService scannerSettingService(Ref ref) {
  final uhf6Plugin = ref.watch(uhf6PluginProvider);
  final sharedPrefs = ref.watch(sharePrefsWrapperProvider).requireValue;

  return ScannerSettingServiceImpl(ref, uhf6Plugin: uhf6Plugin, sharePrefs: sharedPrefs);
}

abstract class ScannerSettingService {
  Future<ScannerSetting> getScannerSetting();
  Future<ReturnResponse> saveScannerSetting(ScannerSetting scannerSetting);
}
