import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/src/common/wrapper/audio_pool_wrapper.dart';
import 'package:techbiz_rfid/src/feature/inventory_tags/edit_tags/application/edit_tag_service_impl.dart';
import 'package:techbiz_rfid/src/feature/inventory_tags/edit_tags/domain/edit_tag_data.dart';
import 'package:uhf6_plugin/uhf6_plugin.dart';

part 'edit_tag_service.g.dart';

@riverpod 
EditTagService editTagService(Ref ref) {
  final audioPool = ref.watch(audioPoolWrapperProvider);
  final uhf6Plugin = ref.watch(uhf6PluginProvider);

  return EditTagServiceImpl(audioPool: audioPool, uhf6Plugin: uhf6Plugin);
}

abstract interface class EditTagService {
  Future<String?> readTag(EditTagData tagData);
  Future<void> playScannerSound();
}
