import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/src/common/db/app_database.dart';
import 'package:techbiz_rfid/src/feature/inventory/scanner/data/scanner_repository_impl.dart';

part 'scanner_repository.g.dart';

@riverpod 
ScannerRepository scannerRepository(Ref ref) {
  return ScannerRepositoryImpl();
}

abstract class ScannerRepository {
  Future<void> insertScanData(ScanResultCompanion scanResult,ScanResultItemCompanion scanData);
}