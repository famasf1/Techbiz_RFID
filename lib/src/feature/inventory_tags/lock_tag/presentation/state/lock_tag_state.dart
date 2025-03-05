import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/src/common/const/app_const.dart';
import 'package:techbiz_rfid/src/common/domain/tags/tag_info.dart';
import 'package:techbiz_rfid/src/feature/inventory_tags/edit_tags/domain/interface/edit_tag_service.dart';
import 'package:techbiz_rfid/src/feature/inventory_tags/lock_tag/domain/lock_tag_request.dart';
import 'package:techbiz_rfid/src/feature/inventory_tags/lock_tag/domain/services/lock_tag_service.dart';

part 'lock_tag_state.g.dart';

@riverpod
class LockTagTypeState extends _$LockTagTypeState {
  List<String> get epcListItem => [TagTypeConst.EPC, TagTypeConst.TID];

  @override
  String build() {
    return epcListItem.first;
  }

  onSelected(String value) {
    state = value;
  }
}

@riverpod
class ScanButtonLockTagViewState extends _$ScanButtonLockTagViewState {
  @override
  bool build() {
    return false;
  }

  FutureOr<void> onPressed() async {
    final editTagService = ref.watch(lockTagServiceProvider);
    final editTagTypeState = ref.read(lockTagTypeStateProvider);
    state = !state;

    switch (state) {
      case true:
        await editTagService.startScanning(editTagTypeState == TagTypeConst.TID);
      case false:
        await editTagService.stopScanning();
    }
  }
}

@riverpod
class LockTagRequestDataState extends _$LockTagRequestDataState {
  @override
  LockTagRequest build() {
    return LockTagRequest();
  }

  Future<void> readTag(String tagId) async {
    state = state.copyWith(epcTag: tagId);
  }
}

@riverpod
class LockTagInfoState extends _$LockTagInfoState {
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