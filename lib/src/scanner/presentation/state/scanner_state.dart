import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/src/scanner/domain/scan_data.dart';

part 'scanner_state.g.dart';

@riverpod 
class ScanDataState extends _$ScanDataState {
  @override
  List<ScanData> build() {
    return List.empty();
  }

  void addData(ScanData data) {
    state.add(data);
  }
}
