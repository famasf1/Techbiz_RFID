import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/src/common/const/app_const.dart';
import 'package:techbiz_rfid/src/common/domain/tags/tag_info.dart';
import 'package:techbiz_rfid/src/feature/inventory_tags/edit_tags/domain/edit_tag_request_data.dart';
import 'package:techbiz_rfid/src/feature/inventory_tags/edit_tags/domain/edit_tag_response_data.dart';
import 'package:techbiz_rfid/src/feature/inventory_tags/edit_tags/domain/interface/edit_tag_service.dart';

part 'edit_tag_state.g.dart';

@riverpod
class EditTagInfoState extends _$EditTagInfoState {
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
class EditTagRequestDataState extends _$EditTagRequestDataState {
  @override
  EditTagRequestData build() {
    return EditTagRequestData();
  }

  Future<void> readTag(String tagId) async {
    final editTagResponse = ref.read(editTagResponseDataStateProvider.notifier);
    state = state.copyWith(tagId: tagId);

    await editTagResponse.updateTagResponse();
  }

  Future<void> readTagWithPassword(String tagId, String password) async {
    final editTagResponse = ref.read(editTagResponseDataStateProvider.notifier);
    state = state.copyWith(tagId: tagId, accessPassword: password);

    await editTagResponse.updateTagResponse();
  }

  Future<void> updateTagFromTextField(String newTagId) async {
    state = state.copyWith(tagId: newTagId);
  }

  Future<void> writeTag() async {
    final editTagService = ref.watch(editTagServiceProvider);
    await editTagService.writeTag(state);
  }

  Future<void> writeTagWithPassword(String password) async {
    final editTagService = ref.watch(editTagServiceProvider);
    state = state.copyWith(accessPassword: password);
    await editTagService.writeTag(state);
  }
}

@riverpod
class EditTagResponseDataState extends _$EditTagResponseDataState {
  @override
  Future<EditTagResponseData> build() async {
    return EditTagResponseData();
  }

  Future<void> updateTagResponse() async {
    final editTagService = ref.read(editTagServiceProvider);
    final editTagRequest = ref.read(editTagRequestDataStateProvider);
    final editTagType = ref.read(editTagTypeStateProvider);
    state = const AsyncLoading();
    state =
        await AsyncValue.guard(() => editTagService.readTag(editTagRequest, editTagType == TagTypeConst.TID));
  }
}

@riverpod
class ScanButtonEditTagViewState extends _$ScanButtonEditTagViewState {
  @override
  bool build() {
    return false;
  }

  FutureOr<void> onPressed() async {
    final editTagService = ref.watch(editTagServiceProvider);
    final editTagTypeState = ref.read(editTagTypeStateProvider);
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
class EditTagTypeState extends _$EditTagTypeState {
  List<String> get epcListItem => [TagTypeConst.EPC, TagTypeConst.TID];

  @override
  String build() {
    return epcListItem.first;
  }

  onSelected(String value) {
    state = value;
  }
}
