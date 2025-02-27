import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:techbiz_rfid/src/common/const/app_const.dart';
import 'package:techbiz_rfid/src/common/domain/return_response.dart';
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
    final tagInfoList = ref.watch(scanTagInfoStateProvider);
    final scanButtonEditTagViewState =
        ref.watch(scanButtonEditTagViewStateProvider);
    final editTagService = ref.watch(editTagServiceProvider);
    final editTagResponse = ref.watch(editTagResponseDataStateProvider);

    ref.listen(editTagResponseDataStateProvider, (prev, next) {
      if (next.hasError && prev!.hasError) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) async {
            await showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                ReturnResponse? errRes;

                if (next.error is ReturnResponse) {
                  errRes = ReturnResponse.fromJson(
                      next.error as Map<String, dynamic>);
                }

                return GeneralPopUpError(
                  title: errRes != null
                      ? errRes.code
                      : context.translation.error,
                  content:
                      errRes != null ? errRes.message : next.error.toString(),
                  actions: [
                    OutlinedButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(context.translation.okTxt,
                          style: context.theme.textTheme.bodyMedium),
                    )
                  ],
                );
              },
            );
          },
        );
      }
    });

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
              ref.read(scanTagInfoStateProvider.notifier).addData(tagInfoList);
              ref.read(scanTagInfoStateProvider.notifier).playSound();
            }
          }
        default:
          debugPrint("Unknown Event");
      }
    });

    return GeneralAppBar(
      appbarTitle: "Edit Tag",
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Select Tag to Edit",
              textAlign: TextAlign.start,
              style: context.theme.textTheme.headlineMedium,
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
                replacement: Center(child: Text("No Data")),
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
                  label: Text("Start Scanning"),
                  icon: FaIcon(FontAwesomeIcons.scannerGun),
                ),
                child: FilledButton.icon(
                  onPressed: () => ref
                      .read(scanButtonEditTagViewStateProvider.notifier)
                      .onPressed(),
                  label: Text("Stop Scanning"),
                  icon: FaIcon(FontAwesomeIcons.stop),
                ),
              ),
            ),
            AsyncValueWidget(
              value: editTagResponse,
              data: (epc) => SizedBox(
                child: Text(epc.epcId),
              ),
              error: (e, st) => SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
