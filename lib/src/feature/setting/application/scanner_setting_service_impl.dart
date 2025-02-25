import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:techbiz_rfid/src/common/const/app_const.dart';
import 'package:techbiz_rfid/src/common/domain/return_response.dart';
import 'package:techbiz_rfid/src/common/extensions/app_locale_extension.dart';
import 'package:techbiz_rfid/src/common/wrapper/share_prefs_wrapper.dart';
import 'package:techbiz_rfid/src/feature/setting/domain/scanner_setting.dart';
import 'package:techbiz_rfid/src/feature/setting/domain/service/scanner_service_service.dart';
import 'package:uhf6_plugin/generated/uhf6_lib_api.g.dart';
import 'package:uhf6_plugin/uhf6_plugin.dart';

class ScannerSettingServiceImpl implements ScannerSettingService {
  final IUhf6Plugin uhf6Plugin;
  final SharePrefsWrapper sharePrefs;
  final Ref ref;

  const ScannerSettingServiceImpl(this.ref,
      {required this.uhf6Plugin, required this.sharePrefs});

  @override
  Future<ScannerSetting> getScannerSetting() async {
    final regionConf = await _getRegionConf();
    final powerData = await _getPowerSetting();
    final userLanguage = await _getUserLanguageSetting();

    return ScannerSetting(
      readPower: powerData.readPower,
      writePower: powerData.writePower,
      frequencyArea: regionConf.frequencyArea,
      language: userLanguage?.language,
    );
  }

  @override
  Future<ReturnResponse> saveScannerSetting(
      ScannerSetting scannerSetting) async {
    try {
      final result = await Future.wait([
        _saveRegionConf(scannerSetting),
        _savePowerSetting(scannerSetting),
        _saveUserLanguageSetting(scannerSetting),
      ]);

      if (result.any(
        (element) => element.statusCode != AppStatusCode.success,
      )) {
        final Map<String, dynamic> errorMessage = jsonDecode(result
            .firstWhere((elem) => elem.statusCode == AppStatusCode.error)
            .message);

        throw ReturnResponse(
          statusCode: AppStatusCode.error,
          message: errorMessage["message"],
        );
      }

      return ReturnResponse(
          statusCode: AppStatusCode.success, message: "Success");
    } catch (e) {
      rethrow;
    }
  }

  Future<ScannerSetting?> _getUserLanguageSetting() async {
    final language = await sharePrefs.getString(AppConfig.userLanguage);

    return ScannerSetting(
      language: language,
    );
  }

  Future<ScannerSetting> _getPowerSetting() async {
    final powerData = await uhf6Plugin.getPower();

    return ScannerSetting(
      readPower: powerData.power![0] ?? 0,
      writePower: powerData.power![1] ?? 0,
    );
  }

  Future<ScannerSetting> _getRegionConf() async {
    final regionConf = await uhf6Plugin.getRegionConf();
    switch (regionConf.region) {
      case RegionConf.RG_EU:
        return ScannerSetting(
          frequencyArea: FrequencyArea.RG_EU,
        );
      case RegionConf.RG_EU2:
        return ScannerSetting(
          frequencyArea: FrequencyArea.RG_EU2,
        );
      case RegionConf.RG_EU3:
        return ScannerSetting(
          frequencyArea: FrequencyArea.RG_EU3,
        );
      case RegionConf.RG_KR:
        return ScannerSetting(
          frequencyArea: FrequencyArea.RG_KR,
        );
      case RegionConf.RG_NA:
        return ScannerSetting(
          frequencyArea: FrequencyArea.RG_NA,
        );
      case RegionConf.RG_PRC:
        return ScannerSetting(
          frequencyArea: FrequencyArea.RG_PRC,
        );
      case RegionConf.RG_NONE:
        return ScannerSetting(
          frequencyArea: FrequencyArea.RG_NONE,
        );
      case RegionConf.RG_OPEN:
        return ScannerSetting(
          frequencyArea: FrequencyArea.RG_OPEN,
        );
      default:
        return ScannerSetting(
          frequencyArea: FrequencyArea.RG_NONE,
        );
    }
  }

  Future<ReturnResponse> _saveUserLanguageSetting(
      ScannerSetting scannerSetting) async {
    try {
      await sharePrefs.setString(
          AppConfig.userLanguage, scannerSetting.language!);

      ref
          .read(languageStateProvider.notifier)
          .setLanguage(scannerSetting.language!);

      return ReturnResponse(
          statusCode: AppStatusCode.success, message: "Success");
    } catch (e) {
      return ReturnResponse(
          statusCode: AppStatusCode.error, message: e.toString());
    }
  }

  Future<ReturnResponse> _savePowerSetting(
      ScannerSetting scannerSetting) async {
    try {
      final powerData = await uhf6Plugin.setPower(
        PowerParam(
          power: [
            scannerSetting.readPower,
            scannerSetting.writePower,
          ],
        ),
      );

      if (powerData.code == Code.error) {
        throw Exception(powerData.description);
      }

      return ReturnResponse(
          statusCode: AppStatusCode.success,
          message: powerData.description.toString());
    } catch (e) {
      return ReturnResponse(
          statusCode: AppStatusCode.error, message: e.toString());
    }
  }

  Future<ReturnResponse> _saveRegionConf(ScannerSetting scannerSetting) async {
    RegionConfRes? regionSetConf;
    try {
      switch (scannerSetting.frequencyArea) {
        case FrequencyArea.RG_EU:
          regionSetConf = await uhf6Plugin.setRegionConf(RegionConf.RG_EU);
        case FrequencyArea.RG_EU2:
          regionSetConf = await uhf6Plugin.setRegionConf(RegionConf.RG_EU2);
        case FrequencyArea.RG_EU3:
          regionSetConf = await uhf6Plugin.setRegionConf(RegionConf.RG_EU3);
        case FrequencyArea.RG_KR:
          regionSetConf = await uhf6Plugin.setRegionConf(RegionConf.RG_KR);
        case FrequencyArea.RG_NA:
          regionSetConf = await uhf6Plugin.setRegionConf(RegionConf.RG_NA);
        case FrequencyArea.RG_NONE:
          regionSetConf = await uhf6Plugin.setRegionConf(RegionConf.RG_NONE);
        case FrequencyArea.RG_PRC:
          regionSetConf = await uhf6Plugin.setRegionConf(RegionConf.RG_PRC);
        case FrequencyArea.RG_OPEN:
          regionSetConf = await uhf6Plugin.setRegionConf(RegionConf.RG_OPEN);
      }

      if (regionSetConf.code == Code.error) {
        throw Exception(regionSetConf.description);
      }

      return ReturnResponse(
        statusCode: AppStatusCode.success,
        message: regionSetConf.description.toString(),
      );
    } catch (e) {
      return ReturnResponse(
        statusCode: AppStatusCode.error,
        message: regionSetConf?.description.toString() ?? e.toString(),
      );
    }
  }
}
