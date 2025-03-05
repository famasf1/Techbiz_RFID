import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/src/feature/inventory/scanner/domain/interface/scanner_service.dart';
import 'package:techbiz_rfid/src/feature/inventory_tags/lock_tag/application/lock_tag_service_impl.dart';
import 'package:techbiz_rfid/src/feature/inventory_tags/lock_tag/domain/lock_tag_request.dart';

part 'lock_tag_service.g.dart';

@riverpod
LockTagService lockTagService(Ref ref) {
  final scannerService = ref.watch(scannerServiceProvider);

  return LockTagServiceImpl(
    audioPool: scannerService.audioPool,
    uhfWrapper: scannerService.uhfWrapper,
    scannerService: scannerService,
  );
}

abstract interface class LockTagService extends ScannerService {
  LockTagService({required super.uhfWrapper, required super.audioPool});

  Future<bool> lockInventoryTag(LockTagRequest param);
  Future<bool> unlockInventoryTag(LockTagRequest param);
}
