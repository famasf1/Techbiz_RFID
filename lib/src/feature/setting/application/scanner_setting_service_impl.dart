import 'package:techbiz_rfid/src/feature/setting/domain/scanner_setting.dart';
import 'package:techbiz_rfid/src/feature/setting/domain/service/scanner_service_service.dart';
import 'package:uhf6_plugin/generated/uhf6_lib_api.g.dart';
import 'package:uhf6_plugin/uhf6_plugin.dart';

class ScannerSettingServiceImpl implements ScannerSettingService {
  final IUhf6Plugin uhf6Plugin;

  const ScannerSettingServiceImpl({required this.uhf6Plugin});

  @override
  Future<ScannerSetting> getScannerSetting() async {
    // final regionConf = await uhf6Plugin.getRegionConf();
    final powerData = await uhf6Plugin.getPower();

    return ScannerSetting(
      readPower: powerData.power![0] ?? 0,
      writePower: powerData.power![1] ?? 0,
    );
  }

  @override
  Future<void> saveScannerSetting(ScannerSetting scannerSetting) async {
    // final setRegionConf =
    //     await uhf6Plugin.setRegionConf(scannerSetting.frequencyArea);
    final powerData = await uhf6Plugin.setPower(
      PowerParam(
        power: [
          scannerSetting.readPower,
          scannerSetting.writePower,
        ],
      ),
    );
  }
  
  @override
  Future<ScannerSetting> getPowerSetting() async {
    final powerData = await uhf6Plugin.getPower();

    return ScannerSetting(
      readPower: powerData.power![0] ?? 0,
      writePower: powerData.power![1] ?? 0,
    );
  }
}
