import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/src/scanner/application/scanner_service_impl.dart';
import 'package:uhf6_plugin/generated/uhf6_lib_api.g.dart';
import 'package:uhf6_plugin/uhf6_plugin.dart';

part 'scanner_service.g.dart';

@riverpod
ScannerService scannerService(Ref ref) {
  // final uhfWrapper = ref.watch(uhfWrapperProvider);
  final uhf6Plugin = ref.watch(uhf6PluginProvider);
  const EventChannel eventChannel = EventChannel("com.techbusiness.rfid.event");

  return ScannerServiceImpl(uhfWrapper: uhf6Plugin, eventChannel: eventChannel);
}

abstract class ScannerService {
  Future<InstanceResponse> getInstance();
  Future<void> startScanning();
  Future<void> stopScanning();
  Future<HardwareResponse> getHardwareVersion();
}
