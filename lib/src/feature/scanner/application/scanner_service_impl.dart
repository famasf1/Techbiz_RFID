import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:techbiz_rfid/src/common/domain/event_channel_response.dart';
import 'package:techbiz_rfid/src/feature/scanner/domain/interface/scanner_service.dart';
import 'package:uhf6_plugin/generated/uhf6_lib_api.g.dart';
import 'package:uhf6_plugin/uhf6_plugin.dart';

class ScannerServiceImpl implements ScannerService {
  final IUhf6Plugin uhfWrapper;
  static const EventChannel eventChannel = EventChannel("com.techbusiness.rfid.event");

  const ScannerServiceImpl(
      {required this.uhfWrapper});

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
    // final startRes = await uhfWrapper.asyncStartScanning();
    // if (startRes.code == Code.success) {
      final result = await uhfWrapper.tagInventoryRealTime();
      if (result.code == Code.success) {
        debugPrint(result.toString());
      }
    // }
  }

  @override
  Future<void> stopScanning() async {
    // final stopRes = await uhfWrapper.asyncStopScanning();
    // if (stopRes.code == Code.success) {
      final result = await uhfWrapper.stopTagInventory();
      if (result.code == Code.success) {
        debugPrint(result.toString());
      }
    // }
  }

  @override
  FutureOr<void> listenScannerButtonClick() async {
    await uhfWrapper.listenScannerButtonClick();
  }

  @override
  FutureOr<void> stopListenScannerButtonClick() async {
    await uhfWrapper.stopListenScannerButtonClick();
  }

  @override
  void startListening(Function(EventChannelResponse) onData) {
    eventChannel.receiveBroadcastStream().listen((event) {
      if (event is String) {
        final eventResult = jsonDecode(event);
        final data = EventChannelResponse.fromJson(eventResult);
        onData(data);
      }
    }, onError: (error) {
      debugPrint("Error in listening: $error");
    });
  }
}
