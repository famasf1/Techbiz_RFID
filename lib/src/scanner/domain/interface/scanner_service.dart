import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/src/common/domain/event_channel_response.dart';
import 'package:techbiz_rfid/src/scanner/application/scanner_service_impl.dart';
import 'package:uhf6_plugin/generated/uhf6_lib_api.g.dart';
import 'package:uhf6_plugin/uhf6_plugin.dart';

part 'scanner_service.g.dart';

@riverpod
ScannerService scannerService(Ref ref) {
  // final uhfWrapper = ref.watch(uhfWrapperProvider);
  final uhf6Plugin = ref.watch(uhf6PluginProvider);

  ref.onDispose(() {
    uhf6Plugin.stopListenScannerButtonClick();
  });

  return ScannerServiceImpl(uhfWrapper: uhf6Plugin);
}

abstract class ScannerService {
  Future<InstanceResponse> getInstance();
  Future<void> startScanning();
  Future<void> stopScanning();
  Future<HardwareResponse> getHardwareVersion();
  FutureOr<void> listenScannerButtonClick();
  FutureOr<void> stopListenScannerButtonClick();
  void startListening(Function(EventChannelResponse) onData);
}
