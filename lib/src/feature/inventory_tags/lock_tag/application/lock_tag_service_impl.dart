import 'package:techbiz_rfid/src/feature/inventory/scanner/domain/interface/scanner_service.dart';
import 'package:techbiz_rfid/src/feature/inventory_tags/lock_tag/domain/lock_tag_request.dart';
import 'package:techbiz_rfid/src/feature/inventory_tags/lock_tag/domain/services/lock_tag_service.dart';
import 'package:uhf6_plugin/generated/uhf6_lib_api.g.dart';

class LockTagServiceImpl extends ScannerService implements LockTagService {
  final ScannerService scannerService;

  LockTagServiceImpl({required this.scannerService, required super.uhfWrapper, required super.audioPool});
  
  @override
  Future<bool> lockInventoryTag(LockTagRequest param) async {
    final lockTagParam = param.toJson();
    final result = await uhfWrapper.lockTag(lockTagParam);

    return result.code == Code.success;
  }
  
  @override
  Future<bool> unlockInventoryTag(LockTagRequest param) async {
    final lockTagParam = param.toJson();
    final result = await uhfWrapper.lockTag(lockTagParam);

    return result.code == Code.success;
  }
}