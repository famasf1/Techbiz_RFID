import 'package:techbiz_rfid/src/common/wrapper/audio_pool_wrapper.dart';
import 'package:techbiz_rfid/src/feature/inventory_tags/edit_tags/domain/edit_tag_data.dart';
import 'package:techbiz_rfid/src/feature/inventory_tags/edit_tags/domain/interface/edit_tag_service.dart';
import 'package:uhf6_plugin/generated/uhf6_lib_api.g.dart';
import 'package:uhf6_plugin/uhf6_plugin.dart';

class EditTagServiceImpl implements EditTagService {
  final AudioPoolWrapper audioPool;
  final IUhf6Plugin uhf6Plugin;
  const EditTagServiceImpl({required this.audioPool, required this.uhf6Plugin});

  @override
  Future<String?> readTag(EditTagData tagData) async {
    
    final params = tagData.toJson();

    final result = await uhf6Plugin.readTagInventoryEPC(params);
    if (result.code == Code.success) {
      return result.tagInfoResult;
    }
  }

  @override
  Future<void> playScannerSound() async {
    await audioPool.playScannerSound();
  }
}
