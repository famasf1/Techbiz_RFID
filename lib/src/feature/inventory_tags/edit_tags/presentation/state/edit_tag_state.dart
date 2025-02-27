import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:techbiz_rfid/src/common/domain/tags/tag_info.dart';
import 'package:techbiz_rfid/src/feature/inventory_tags/edit_tags/domain/edit_tag_request_data.dart';
import 'package:techbiz_rfid/src/feature/inventory_tags/edit_tags/domain/edit_tag_response_data.dart';
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
}

@riverpod
class EditTagResponseDataState extends _$EditTagResponseDataState {
  @override
  Future<EditTagResponseData> build() async {
    return EditTagResponseData();
  }

  Future<void> updateTagResponse() async {
    final editTagService = ref.watch(editTagServiceProvider);
    final editTagRequest = ref.watch(editTagRequestDataStateProvider);
    state = const AsyncLoading();
    state =
        await AsyncValue.guard(() => editTagService.readTag(editTagRequest));
    ref.invalidateSelf();
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
    state = !state;

    switch (state) {
      case true:
        await editTagService.startScanning();
      case false:
        await editTagService.stopScanning();
    }
  }
}
