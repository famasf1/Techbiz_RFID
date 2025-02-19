import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/src/scanner/domain/interface/scanner_service.dart';
import 'package:techbiz_rfid/src/scanner/domain/scan_data.dart';

part 'scanner_state.g.dart';

@riverpod
class ScanDataState extends _$ScanDataState {
  @override
  FutureOr<List<ScanData>> build() async {
    final scannerService = ref.watch(scannerServiceProvider);

    return List.empty();
  }

  // void addData(ScanData data) {
  //   state.add(data);
  // }
}

@riverpod
class ScanButtonState extends _$ScanButtonState {
  @override
  bool build() {
    return false;
  }

  void onPressed() {
    state = !state;
  }
}
