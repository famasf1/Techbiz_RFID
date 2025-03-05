import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techbiz_rfid/src/common/const/app_const.dart';
import 'package:techbiz_rfid/src/common/extensions/app_locale_extension.dart';
import 'package:techbiz_rfid/src/common/extensions/theme_extension.dart';
import 'package:techbiz_rfid/src/common/widgets/general_appbar.dart';
import 'package:techbiz_rfid/src/feature/inventory/scanner/domain/enum/scan_code_enum.dart';
import 'package:techbiz_rfid/src/feature/inventory_tags/lock_tag/domain/services/lock_tag_service.dart';
import 'package:techbiz_rfid/src/feature/inventory_tags/lock_tag/presentation/state/lock_tag_state.dart';

class LockTagView extends ConsumerStatefulWidget {
  const LockTagView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LockTagViewState();
}

class _LockTagViewState extends ConsumerState<LockTagView> {
  @override
  void initState() {
    super.initState();
    _initializeServiceInstance();
  }

  Future<void> _initializeServiceInstance() async {
    final scannerService = ref.read(lockTagServiceProvider);
    await scannerService.listenScannerButtonClick();
  }

  @override
  Widget build(BuildContext context) {
    final tagInfoList = ref.watch(lockTagInfoStateProvider);
    final lockTagService = ref.read(lockTagServiceProvider);
    final lockTagTypeState = ref.watch(lockTagTypeStateProvider);
    final scanButtonLockTagViewState =
        ref.watch(scanButtonLockTagViewStateProvider);
    final lockTagList = ref.read(lockTagTypeStateProvider.notifier).epcListItem;

    lockTagService.startListening((data) async {
      switch (data.eventType) {
        case EventChannelConst.scannerInputEvent:
          ScanCode? scanCode = ScanCode.fromKeyCode(data.payload as String);

          switch (scanCode) {
            case ScanCode.leftSide:
              debugPrint("Left Side");
            case ScanCode.trigger:
              await ref
                  .read(scanButtonLockTagViewStateProvider.notifier)
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
              ref.read(lockTagInfoStateProvider.notifier).addData(tagInfoList);
              ref.read(lockTagInfoStateProvider.notifier).playSound();
            }
          }
        default:
          debugPrint("Unknown Event");
      }
    });

    return GeneralAppBar(
      appbarTitle: context.translation.lockTag,
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
                  value: lockTagTypeState,
                  onChanged: scanButtonLockTagViewState
                      ? null
                      : (value) {
                          ref
                              .read(lockTagTypeStateProvider.notifier)
                              .onSelected(value!);

                          ref.invalidate(lockTagInfoStateProvider);
                          // ref.invalidate(lockTagResponseDataStateProvider);
                        },
                  items:
                      lockTagList.map<DropdownMenuItem<String>>((String value) {
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
                replacement: Center(
                  child: Text(context.translation.noData),
                ),
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
                          .read(lockTagRequestDataStateProvider.notifier)
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
                visible: scanButtonLockTagViewState,
                replacement: FilledButton.icon(
                  onPressed: () => ref
                      .read(scanButtonLockTagViewStateProvider.notifier)
                      .onPressed(),
                  label: Text(context.translation.startScanning),
                  icon: FaIcon(FontAwesomeIcons.scannerGun),
                ),
                child: FilledButton.icon(
                  onPressed: () => ref
                      .read(scanButtonLockTagViewStateProvider.notifier)
                      .onPressed(),
                  label: Text(context.translation.stopScanning),
                  icon: FaIcon(FontAwesomeIcons.stop),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
