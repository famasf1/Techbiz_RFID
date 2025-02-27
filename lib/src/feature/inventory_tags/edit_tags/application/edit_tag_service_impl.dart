import 'package:techbiz_rfid/src/feature/inventory/scanner/domain/interface/scanner_service.dart';
import 'package:techbiz_rfid/src/feature/inventory_tags/edit_tags/domain/edit_tag_request_data.dart';
import 'package:techbiz_rfid/src/feature/inventory_tags/edit_tags/domain/edit_tag_response_data.dart';
import 'package:techbiz_rfid/src/feature/inventory_tags/edit_tags/domain/interface/edit_tag_service.dart';

class EditTagServiceImpl extends ScannerService implements EditTagService {
  final ScannerService scannerService;
  EditTagServiceImpl({required super.audioPool, required super.uhfWrapper, required this.scannerService});

  @override
  Future<EditTagResponseData> readTag(EditTagRequestData tagData) async {
    final params = tagData.toJson();
    try {
      final tagResult = await uhfWrapper.readTagInventoryEPC(params);
      final result = EditTagResponseData(epcId: tagResult.tagInfoResult ?? "");

      return result;
    } catch (e) {
      rethrow;
    }
  }
  
  @override
  Future<bool?> writeTag(EditTagRequestData tagData) {
    // TODO: implement writeTag
    throw UnimplementedError();
  }
}
