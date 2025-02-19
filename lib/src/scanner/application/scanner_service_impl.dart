import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:techbiz_rfid/src/scanner/domain/interface/scanner_service.dart';
import 'package:uhf6_plugin/generated/uhf6_lib_api.g.dart';
import 'package:uhf6_plugin/uhf6_plugin.dart';

class ScannerServiceImpl implements ScannerService {
  final IUhf6Plugin uhfWrapper;
  final EventChannel eventChannel;

  const ScannerServiceImpl({required this.uhfWrapper, required this.eventChannel});

  @override 
  Future<InstanceResponse> getInstance() async {
    final result = await uhfWrapper.initializingInstance();
    return result;
  }

  @override
  Future<HardwareResponse> getHardwareVersion() async {
    final result = await uhfWrapper.getHardware();
    return result;
  }

  @override
  Future<void> startScanning() async {
    final startRes = await uhfWrapper.asyncStartScanning();
    if (startRes.code == Code.success) {
      final result = await uhfWrapper.tagInventoryRealTime();
      debugPrint(result.tagInfo.toString());
    }
  }

  @override
  Future<void> stopScanning() async {
    final stopRes = await uhfWrapper.asyncStopScanning();
    if (stopRes.code == Code.success) {
      await uhfWrapper.stopTagInventory();
    }
  }
}
