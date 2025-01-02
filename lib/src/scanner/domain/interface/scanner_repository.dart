import 'package:techbiz_rfid/src/common/db/app_database.dart';

abstract class ScannerRepository {
  Future<void> insertScanData(ScanResultCompanion scanResult,ScanResultItemCompanion scanData);
}