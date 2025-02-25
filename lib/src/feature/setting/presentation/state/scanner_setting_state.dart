import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/src/common/domain/return_response.dart';
import 'package:techbiz_rfid/src/feature/setting/domain/scanner_setting.dart';
import 'package:techbiz_rfid/src/feature/setting/domain/service/scanner_service_service.dart';

part 'scanner_setting_state.g.dart';

@riverpod
class ScannerSettingState extends _$ScannerSettingState {
  @override
  ScannerSetting build() {
    return ScannerSetting();
  }

  Future setDefaultSetting() async {
    final scannerSettingService = ref.watch(scannerSettingServiceProvider);
    final scannerSetting = await scannerSettingService.getScannerSetting();

    state = state.copyWith(
      readPower: scannerSetting.readPower,
      writePower: scannerSetting.writePower,
      frequencyArea: scannerSetting.frequencyArea,
      language: scannerSetting.language,
    );
  }

  updateLanguage(String language) {
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

  Future<ReturnResponse> saveScannerSetting() async {
    final scannerSettingService = ref.watch(scannerSettingServiceProvider);

    var result = await scannerSettingService.saveScannerSetting(state);
    return result;
  }
}

@riverpod
class ScannerSettingButtonState extends _$ScannerSettingButtonState {
  @override
  FutureOr<void> build() async {
    /// Leave empty
  }

  FutureOr<void> onPressed() async {
    final scannerSettingState = ref.read(scannerSettingStateProvider.notifier);
    state = const AsyncLoading();
    state =
        await AsyncValue.guard(() => scannerSettingState.saveScannerSetting());
    ref.invalidateSelf();
  }
}
