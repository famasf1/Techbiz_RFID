import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/src/common/wrapper/interface/uhf_wrapper.dart';
import 'package:uhf_c72_plugin/uhf_c72_plugin.dart';

part 'uhf_wrapper.g.dart';

@riverpod
UhfWrapperImpl uhfWrapper(Ref ref) {
  return UhfWrapperImpl();
}

class UhfWrapperImpl implements UhfWrapper {
  const UhfWrapperImpl();

  @override
  Future<bool?> initUhf() async {
    final result = await UhfC72Plugin.connect;
    return result;
  }

  @override
  Future<bool?> isConnected() async {
    final result = await UhfC72Plugin.isConnected;
    return result;
  }

  @override
  Future<bool?> startReading(StartMode mode) async {
    final isReading = await UhfC72Plugin.isStarted;
    if (isReading == true) {
      return true;
    } else {
      switch (mode) {
        case StartMode.single:
          final result = await UhfC72Plugin.startSingle;
          return result;
        case StartMode.loopContinuous:
          final result = await UhfC72Plugin.startContinuous;
          return result;
      }
    }
  }

  @override
  Future<bool?> stopReading() async {
    final result = await UhfC72Plugin.stop;
    return result;
  }

  @override
  Future<bool?> disposeUhf() async {
    bool? result = await UhfC72Plugin.clearData;
    result = await UhfC72Plugin.close;
    return result;
  }
  
  @override
  Future<bool?> setPowerLevel(PowerLevel powerLevel) async {
    switch (powerLevel) {
      case PowerLevel.lowest:
        return await UhfC72Plugin.setPowerLevel('5');
      case PowerLevel.low:
        return await UhfC72Plugin.setPowerLevel('10');
      case PowerLevel.medium:
        return await UhfC72Plugin.setPowerLevel('15');
      case PowerLevel.high:
        return await UhfC72Plugin.setPowerLevel('20');
      case PowerLevel.veryhigh:
        return await UhfC72Plugin.setPowerLevel('25');
      case PowerLevel.max:
        return await UhfC72Plugin.setPowerLevel('30');
    }
  }
  
  @override
  Future<bool?> setWorkArea(WorkArea workAreaLevel) async {
    switch (workAreaLevel) {
      case WorkArea.smallest:
        return await UhfC72Plugin.setWorkArea('1');
      case WorkArea.verysmall:
        return await UhfC72Plugin.setWorkArea('2');
      case WorkArea.small:
        return await UhfC72Plugin.setWorkArea('4');
      case WorkArea.lowermedium:
        return await UhfC72Plugin.setWorkArea('8');
      case WorkArea.medium:
        return await UhfC72Plugin.setWorkArea('22');
      case WorkArea.large:
        return await UhfC72Plugin.setWorkArea('50');
      case WorkArea.verylarge:
        return await UhfC72Plugin.setWorkArea('51');
      case WorkArea.superlarge:
        return await UhfC72Plugin.setWorkArea('52');
      case WorkArea.max:
        return await UhfC72Plugin.setWorkArea('128');
    }
  }
}
