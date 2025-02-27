import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/generated/assets.gen.dart';
import 'package:techbiz_rfid/src/common/domain/event_channel_response.dart';
import 'package:techbiz_rfid/src/feature/inventory/scanner/application/scanner_service_impl.dart';
import 'package:uhf6_plugin/generated/uhf6_lib_api.g.dart';
import 'package:uhf6_plugin/uhf6_plugin.dart';

part 'scanner_service.g.dart';

@riverpod
ScannerService scannerService(Ref ref) {
  // final uhfWrapper = ref.watch(uhfWrapperProvider);
  final uhf6Plugin = ref.watch(uhf6PluginProvider);
  final audioPool = ref.watch(scannerAudioPoolProvider).requireValue;

  ref.onDispose(() {
    uhf6Plugin.stopListenScannerButtonClick();
  });

  return ScannerServiceImpl(
    uhfWrapper: uhf6Plugin,
    audioPool: audioPool,
  );
}

@Riverpod(keepAlive: true)
Future<AudioPool> scannerAudioPool(Ref ref) async {
  final source = Assets.sound.scannerShort.replaceAll('assets/', '');
  return await AudioPool.createFromAsset(
    path: source,
    maxPlayers: 1,
    audioCache: AudioCache.instance,
    minPlayers: 1,
  );
}

abstract class ScannerService {
  // Future<InstanceResponse> getInstance();
  Future<void> startScanning();
  Future<void> stopScanning();
  Future<HardwareResponse> getHardwareVersion();
  FutureOr<void> listenScannerButtonClick();
  FutureOr<void> stopListenScannerButtonClick();
  void startListening(Function(EventChannelResponse) onData);
  Future<void> playScannerSound();
}
