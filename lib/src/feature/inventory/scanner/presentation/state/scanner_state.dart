import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/src/common/domain/tags/tag_info.dart';
import 'package:techbiz_rfid/src/feature/inventory/scanner/domain/interface/scanner_service.dart';

part 'scanner_state.g.dart';

@riverpod
class ScanDataState extends _$ScanDataState {
  @override
  List<TagInfo> build() {
    return List.empty(growable: true);
  }

  void addData(List tagInfoList) async {
    List<TagInfo> tagInfoListData =
        tagInfoList.map((e) => TagInfo.fromJson(e)).toList();
    state = tagInfoListData;
  }

  Future<void> playSound() async {
    final scannerService = ref.watch(scannerServiceProvider);
    await scannerService.playScannerSound();
  }
}

@riverpod
class ScanButtonState extends _$ScanButtonState {
  @override
  bool build() {
    return false;
  }

  FutureOr<void> onPressed() async {
    final scannerService = ref.watch(scannerServiceProvider);
    state = !state;

    switch (state) {
      case true:
        await scannerService.startScanning();
      case false:
        await scannerService.stopScanning();
    }
  }
}
