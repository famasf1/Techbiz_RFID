import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/src/common/wrapper/interface/uhf_wrapper.dart';
import 'package:techbiz_rfid/src/common/wrapper/uhf_wrapper.dart';
import 'package:techbiz_rfid/src/scanner/application/scanner_service_impl.dart';

part 'scanner_service.g.dart';

@riverpod 
ScannerService scannerService(Ref ref) {
  final uhfWrapper = ref.watch(uhfWrapperProvider);

  return ScannerServiceImpl(uhfWrapper: uhfWrapper);
}

abstract class ScannerService {
  Future<void> startScanning(StartMode mode);
  Future<void> stopScanning(bool shouldDispose);
}