import 'package:techbiz_rfid/src/common/wrapper/interface/uhf_wrapper.dart';
import 'package:techbiz_rfid/src/scanner/domain/interface/scanner_service.dart';

class ScannerServiceImpl implements ScannerService {
  final UhfWrapper uhfWrapper;

  const ScannerServiceImpl({required this.uhfWrapper});

  @override
  Future<void> startScanning(StartMode mode) async {
    final isConnected = await uhfWrapper.isConnected();
    if (isConnected == false) {
      await uhfWrapper.initUhf();
    }

    if (mode == StartMode.single) {
      await uhfWrapper.startReading(StartMode.single);
    } else if (mode == StartMode.loopContinuous) {
      await uhfWrapper.startReading(StartMode.loopContinuous);
    }
  }

  @override
  Future<void> stopScanning(bool shouldDispose) async {
    if (shouldDispose) {
      await uhfWrapper.disposeUhf();
    }
    await uhfWrapper.stopReading();
  }
}
