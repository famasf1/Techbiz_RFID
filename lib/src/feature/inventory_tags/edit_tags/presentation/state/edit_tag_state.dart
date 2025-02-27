import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/src/common/domain/tags/tag_info.dart';
import 'package:techbiz_rfid/src/feature/inventory_tags/edit_tags/domain/edit_tag_data.dart';
import 'package:techbiz_rfid/src/feature/inventory_tags/edit_tags/domain/interface/edit_tag_service.dart';

part 'edit_tag_state.g.dart';

@riverpod
class ScanTagInfoState extends _$ScanTagInfoState {
  @override 
  List<TagInfo> build() {
    return List.empty(growable: true);
  }

  void addData(List tagInfoList) async {
    List<TagInfo> tagInfoListData =
        tagInfoList.map((e) => TagInfo.fromJson(e)).toList();
    state = tagInfoListData;
  }

  Future<void> playSound() async {
    final editTagService = ref.watch(editTagServiceProvider);
    await editTagService.playScannerSound();
  }
}

@riverpod 
class EditTagDataState extends _$EditTagDataState {
  @override
  EditTagData build() {
    return EditTagData();
  }

  Future<void> readTag(String tagId) async {
    final editTagService = ref.watch(editTagServiceProvider);

    await editTagService.readTag(state);
  }
}

