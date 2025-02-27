import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/generated/assets.gen.dart';

part 'audio_pool_wrapper.g.dart';

@riverpod 
AudioPoolWrapper audioPoolWrapper(Ref ref) {
  final audioPool = ref.watch(scannerAudioPoolProvider).requireValue;

  return AudioPoolWrapperImpl(audioPool: audioPool);
}

@Riverpod(keepAlive: true)
Future<AudioPool> scannerAudioPool(Ref ref) async {
  final source = Assets.sound.scanner.replaceAll('assets/', '');
  return await AudioPool.createFromAsset(
    path: source,
    maxPlayers: 1,
    audioCache: AudioCache.instance,
    minPlayers: 1,
  );
}

abstract class AudioPoolWrapper {
  Future<void> playScannerSound();
}

class AudioPoolWrapperImpl implements AudioPoolWrapper {
  final AudioPool audioPool;

  const AudioPoolWrapperImpl({required this.audioPool});

  @override
  Future<void> playScannerSound() async {
    await audioPool.start();
  }
}