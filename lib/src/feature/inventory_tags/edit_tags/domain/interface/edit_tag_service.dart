import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/src/feature/inventory/scanner/domain/interface/scanner_service.dart';
import 'package:techbiz_rfid/src/feature/inventory_tags/edit_tags/application/edit_tag_service_impl.dart';
import 'package:techbiz_rfid/src/feature/inventory_tags/edit_tags/domain/edit_tag_request_data.dart';
import 'package:techbiz_rfid/src/feature/inventory_tags/edit_tags/domain/edit_tag_response_data.dart';

part 'edit_tag_service.g.dart';

@riverpod
EditTagService editTagService(Ref ref) {
  final scannerService = ref.watch(scannerServiceProvider);

  return EditTagServiceImpl(
      audioPool: scannerService.audioPool,
      uhfWrapper: scannerService.uhfWrapper,
      scannerService: scannerService);
}

abstract interface class EditTagService extends ScannerService {
  EditTagService({required super.uhfWrapper, required super.audioPool});

  Future<EditTagResponseData> readTag(EditTagRequestData tagData, bool isTid);
  Future<bool?> writeTag(EditTagRequestData tagData);
}
