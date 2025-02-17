import 'package:techbiz_rfid/src/scanner/domain/interface/scanner_service.dart';
import 'package:uhf6_plugin/generated/uhf6_lib_api.g.dart';
import 'package:uhf6_plugin/uhf6_plugin.dart';

class ScannerServiceImpl implements ScannerService {
  final Uhf6Plugin uhfWrapper;

  const ScannerServiceImpl({required this.uhfWrapper});

  @override
  Future<HardwareResponse> getHardwareVersion() async {
    final result = await uhfWrapper.getHardware();
    return result;
  }
}
