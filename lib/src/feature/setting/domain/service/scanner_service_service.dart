import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/src/feature/setting/application/scanner_setting_service_impl.dart';
import 'package:techbiz_rfid/src/feature/setting/domain/scanner_setting.dart';
import 'package:uhf6_plugin/uhf6_plugin.dart';

part 'scanner_service_service.g.dart';

@riverpod
ScannerSettingService scannerSettingService(Ref ref) {
  final uhf6Plugin = ref.watch(uhf6PluginProvider);

  return ScannerSettingServiceImpl(uhf6Plugin: uhf6Plugin);
}

abstract class ScannerSettingService {
  Future<ScannerSetting> getScannerSetting();
  Future<ScannerSetting> getPowerSetting();
  Future<void> saveScannerSetting(ScannerSetting scannerSetting);
}
