import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/src/common/domain/event_channel_response.dart';
import 'package:techbiz_rfid/src/common/wrapper/audio_pool_wrapper.dart';
import 'package:uhf6_plugin/generated/uhf6_lib_api.g.dart';
import 'package:uhf6_plugin/uhf6_plugin.dart';

part 'scanner_service.g.dart';

@riverpod
ScannerService scannerService(Ref ref) {
  final uhf6Plugin = ref.watch(uhf6PluginProvider);
  final audioPool = ref.watch(audioPoolWrapperProvider);

  ref.onDispose(() {
    uhf6Plugin.stopListenScannerButtonClick();
  });

  return ScannerService(
    uhfWrapper: uhf6Plugin,
    audioPool: audioPool,
  );
}

class ScannerService {
  final IUhf6Plugin uhfWrapper;
  final AudioPoolWrapper audioPool;
  static const EventChannel eventChannel =
      EventChannel("com.techbusiness.rfid.event");

  ScannerService({
    required this.uhfWrapper,
    required this.audioPool,
  });

  Future<HardwareResponse> getHardwareVersion() async {
    final result = await uhfWrapper.getHardware();
    return result;
  }

  Future<void> startScanning(bool isTID) async {
    final result = await uhfWrapper.tagInventoryRealTime(isTID);
    if (result.code == Code.success) {
      debugPrint(result.toString());
    }
    // }
  }

  Future<void> stopScanning() async {
    final result = await uhfWrapper.stopTagInventory();
    if (result.code == Code.success) {
      debugPrint(result.toString());
    }
  }

  FutureOr<void> listenScannerButtonClick() async {
    await uhfWrapper.listenScannerButtonClick();
  }

  FutureOr<void> stopListenScannerButtonClick() async {
    await uhfWrapper.stopListenScannerButtonClick();
  }

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

  Future<void> playScannerSound() async {
    await audioPool.playScannerSound();
  }
}
