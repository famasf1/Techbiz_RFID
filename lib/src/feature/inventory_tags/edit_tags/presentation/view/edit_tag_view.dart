import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:techbiz_rfid/src/common/const/app_const.dart';
import 'package:techbiz_rfid/src/common/extensions/app_locale_extension.dart';
import 'package:techbiz_rfid/src/common/extensions/theme_extension.dart';
import 'package:techbiz_rfid/src/common/widgets/async_value_widget.dart';
import 'package:techbiz_rfid/src/common/widgets/general_appbar.dart';
import 'package:techbiz_rfid/src/common/widgets/general_popup_error.dart';
import 'package:techbiz_rfid/src/feature/inventory/scanner/domain/enum/scan_code_enum.dart';
import 'package:techbiz_rfid/src/feature/inventory_tags/edit_tags/domain/interface/edit_tag_service.dart';
import 'package:techbiz_rfid/src/feature/inventory_tags/edit_tags/presentation/state/edit_tag_state.dart';

class EditTagView extends ConsumerStatefulWidget {
  const EditTagView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditTagViewState();
}

class _EditTagViewState extends ConsumerState<EditTagView> {
  @override
  void initState() {
    super.initState();
    _initializeServiceInstance();
  }

  Future<void> _initializeServiceInstance() async {
    final scannerService = ref.read(editTagServiceProvider);
    await scannerService.listenScannerButtonClick();
  }

  @override
  Widget build(BuildContext context) {
    final tagInfoList = ref.watch(editTagInfoStateProvider);
    final scanButtonEditTagViewState =
        ref.watch(scanButtonEditTagViewStateProvider);
    final editTagService = ref.watch(editTagServiceProvider);
    final editTagResponse = ref.watch(editTagResponseDataStateProvider);
    final editTagTypeState = ref.watch(editTagTypeStateProvider);
    final editTagList = ref.read(editTagTypeStateProvider.notifier).epcListItem;
    final bool isTid = editTagTypeState == TagTypeConst.TID;
    final TextEditingController _textEditingController =
        TextEditingController();

    Future<void> showEditTagDialog(BuildContext context, String epcId) async {
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(context.translation.editTag),
          content: TextFormField(
            controller: _textEditingController,
            onChanged: (value) async => await ref
                .read(editTagRequestDataStateProvider.notifier)
                .updateTagFromTextField(value),
            decoration:
                InputDecoration(hintText: context.translation.editTagHint),
            showCursor: true,
            initialValue: epcId,
          ),
          actions: [
            ElevatedButton(
              onPressed: () async => await ref
                  .read(editTagRequestDataStateProvider.notifier)
                  .writeTag(),
              child: Text(context.translation.okTxt),
            ),
            ElevatedButton(
              onPressed: () => context.pop(),
              child: Text(context.translation.cancelTxt),
            ),
          ],
        ),
      );
    }

    Future<void> showErrorTIDDialog(BuildContext context) {
      return showDialog(
          context: context,
          builder: (context) => GeneralPopUpError(
              title: context.translation.error,
              content: context.translation.errorCannotEditTidTag));
    }

    editTagService.startListening((data) async {
      switch (data.eventType) {
        case EventChannelConst.scannerInputEvent:
          ScanCode? scanCode = ScanCode.fromKeyCode(data.payload as String);

          switch (scanCode) {
            case ScanCode.leftSide:
              debugPrint("Left Side");
            case ScanCode.trigger:
              await ref
                  .read(scanButtonEditTagViewStateProvider.notifier)
                  .onPressed();
            case ScanCode.rightSide:
              debugPrint("Right Side");
            default:
              debugPrint("Unknown");
          }
        case EventChannelConst.scannerTagInfoEvent:
          if (data.payload is List) {
            final tagInfoList = data.payload as List;
            if (tagInfoList.isNotEmpty) {
              ref.read(editTagInfoStateProvider.notifier).addData(tagInfoList);
              ref.read(editTagInfoStateProvider.notifier).playSound();
            }
          }
        default:
          debugPrint("Unknown Event");
      }
    });

    return GeneralAppBar(
      appbarTitle: context.translation.editTag,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  context.translation.selectTag,
                  textAlign: TextAlign.start,
                  style: context.theme.textTheme.headlineSmall,
                ),
                DropdownButton<String>(
                  value: editTagTypeState,
                  onChanged: scanButtonEditTagViewState
                      ? null
                      : (value) {
                          ref
                              .read(editTagTypeStateProvider.notifier)
                              .onSelected(value!);

                          ref.invalidate(editTagInfoStateProvider);
                          ref.invalidate(editTagResponseDataStateProvider);
                        },
                  items:
                      editTagList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
              ),
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              child: Visibility(
                visible: tagInfoList.isNotEmpty,
                replacement: Center(child: Text(context.translation.noData)),
                child: ListView.builder(
                  itemCount: tagInfoList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(tagInfoList[index].epcId),
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {},
                      ),
                      onTap: () async => await ref
                          .read(editTagRequestDataStateProvider.notifier)
                          .readTag(
                            tagInfoList[index].epcId,
                          ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: Visibility(
                visible: scanButtonEditTagViewState,
                replacement: FilledButton.icon(
                  onPressed: () => ref
                      .read(scanButtonEditTagViewStateProvider.notifier)
                      .onPressed(),
                  label: Text(context.translation.startScanning),
                  icon: FaIcon(FontAwesomeIcons.scannerGun),
                ),
                child: FilledButton.icon(
                  onPressed: () => ref
                      .read(scanButtonEditTagViewStateProvider.notifier)
                      .onPressed(),
                  label: Text(context.translation.stopScanning),
                  icon: FaIcon(FontAwesomeIcons.stop),
                ),
              ),
            ),
            AsyncValueWidget(
              value: editTagResponse,
              data: (epc) => Visibility(
                visible: epc.tagId.isNotEmpty,
                replacement: SizedBox(
                  height: 100,
                  child: Center(
                    child: Text(context.translation.noData),
                  ),
                ),
                child: GestureDetector(
                  onLongPress: () async => isTid
                      ? await showErrorTIDDialog(context)
                      : await showEditTagDialog(context, epc.tagId),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: Card(
                      elevation: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              alignment: Alignment.center,
                              child: Image.network(
                                  "https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-13.jpg"),
                            ),
                            _ProductCardItem(
                              headerKey: editTagTypeState == TagTypeConst.TID
                                  ? "TID"
                                  : "EPC ID",
                              text: epc.tagId,
                            ),
                            _ProductCardItem(
                              headerKey: "Product Name",
                              text: "iPhone 13 256GB Red",
                            ),
                            _ProductCardItem(
                              headerKey: "Serial Number",
                              text: "312431445343234343",
                            ),
                            _ProductCardItem(
                              headerKey: "Quantity",
                              text: "1",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // error: (e, st) => SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductCardItem extends StatelessWidget {
  final String text;
  final String headerKey;

  const _ProductCardItem({required this.headerKey, required this.text});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Text(
                  headerKey,
                  style: context.theme.textTheme.bodyMedium,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            VerticalDivider(
              thickness: 3,
              width: 1,
              color: Colors.black,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Text(
                  text,
                  style: context.theme.textTheme.bodyMedium,
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
